<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Models\Attribute;
use App\Models\ProjectStatus;
use App\Models\AttributeType;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    //  GET /api/projects
    public function index(Request $request)
    {
        $query = Project::query();

        //  Filter by standard attributes
        if ($request->has('filters')) {
            foreach ($request->filters as $key => $value) {
                $query->where($key, 'LIKE', "%$value%");
            }
        }

        //  Filter by EAV attributes
        if ($request->has('filters')) {
            foreach ($request->filters as $attributeName => $value) {
                $query->whereHas('attributeValues', function ($q) use ($attributeName, $value) {
                    $q->whereHas('attribute', function ($attrQuery) use ($attributeName) {
                        $attrQuery->where('name', $attributeName);
                    })->where('value', 'LIKE', "%$value%");
                });
            }
        }

        return response()->json($query->with('attributeValues.attribute')->get());
    }

    //  GET /api/projects/{id}
    public function show($id)
    {
        $project = Project::with('attributeValues.attribute')->findOrFail($id);
        return response()->json($project);
    }

    // POST /api/projects
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'status' => 'required|string|max:50',
            'attributes' => 'array' // Dynamic attributes
        ]);

        $project = Project::create([
            'name' => $request->name,
            'status' => $request->status
        ]);

        // Set dynamic attributes
        if ($request->has('attributes')) {
            foreach ($request->attributes as $attributeName => $value) {
                $project->setAttributeValue($attributeName, $value);
            }
        }

        return response()->json($project->load('attributeValues.attribute'), 201);
    }

    // PUT /api/projects/{id}
    public function update(Request $request, $id)
    {
        $project = Project::findOrFail($id);
        $project->update([
            'name' => $request->name,
            'status' => $request->status
        ]);

        // Update dynamic attributes
        if ($request->has('attributes')) {
            foreach ($request->attributes as $attributeName => $value) {
                $project->setAttributeValue($attributeName, $value);
            }
        }

        return response()->json($project->load('attributeValues.attribute'));
    }

    //  DELETE /api/projects/{id}
    public function destroy($id)
    {
        $project = Project::findOrFail($id);
        $project->delete();

        return response()->json(['message' => 'Project deleted successfully']);
    }
}