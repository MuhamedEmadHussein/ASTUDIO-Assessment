<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Project;
use App\Enums\ProjectStatus;
use App\Filters\ProjectFilter;
use App\Http\Requests\StoreProjectRequest;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class ProjectController extends Controller
{
    /**
     * The project filter instance.
     *
     * @var ProjectFilter
     */
    protected $filter;

    /**
     * Create a new controller instance.
     *
     * @param ProjectFilter $filter
     */
    public function __construct(ProjectFilter $filter)
    {
        $this->filter = $filter;
    }

    /**
     * Display a listing of the projects.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function index(Request $request): JsonResponse
    {
        try {
            $query = Project::query();

            // Apply filters
            $query = $this->filter->apply($query, $request);

            // Sort
            $sortField = $request->input('sort_by', 'created_at');
            $sortDirection = $request->input('sort_direction', 'desc');
            $query->orderBy($sortField, $sortDirection);

            $projects = $query->with(['attributeValues.attribute', 'users'])
                ->paginate($request->input('per_page', 15));

            return response()->json($projects);
        } catch (\Exception $e) {
            Log::error('Error fetching projects: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error fetching projects',
                'error' => config('app.debug') ? $e->getMessage() : 'Internal server error'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Store a newly created project in storage.
     *
     * @param StoreProjectRequest $request
     * @return JsonResponse
     */
    public function store(StoreProjectRequest $request): JsonResponse
    {
        try {
            DB::beginTransaction();

            $project = Project::create([
                'name' => $request->name,
                'status' => $request->status
            ]);

            // Attach users
            if ($request->has('user_ids')) {
                $project->users()->attach($request->user_ids);
            }

            // Set dynamic attributes
            if ($request->has('attributes')) {
                foreach ($request->attributes as $name => $value) {
                    $result = $project->setAttributeValue($name, $value);
                    if (!$result) {
                        throw new \Exception("Failed to set attribute: {$name}");
                    }
                }
            }

            DB::commit();

            return response()->json(
                $project->load(['attributeValues.attribute', 'users']),
                Response::HTTP_CREATED
            );
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error creating project: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error creating project',
                'error' => config('app.debug') ? $e->getMessage() : 'Internal server error'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified project.
     *
     * @param string $id
     * @return JsonResponse
     */
    public function show(string $id): JsonResponse
    {
        try {
            $project = Project::with(['attributeValues.attribute', 'users'])
                ->findOrFail($id);

            return response()->json($project);
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'message' => 'Project not found'
            ], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            Log::error('Error fetching project: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error fetching project',
                'error' => config('app.debug') ? $e->getMessage() : 'Internal server error'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Update the specified project in storage.
     *
     * @param StoreProjectRequest $request
     * @param string $id
     * @return JsonResponse
     */
    public function update(StoreProjectRequest $request, string $id): JsonResponse
    {
        try {
            DB::beginTransaction();

            $project = Project::findOrFail($id);

            $project->update([
                'name' => $request->name,
                'status' => $request->status
            ]);

            // Sync users
            if ($request->has('user_ids')) {
                $project->users()->sync($request->user_ids);
            }

            // Update dynamic attributes
            if ($request->has('attributes')) {
                foreach ($request->attributes as $name => $value) {
                    $result = $project->setAttributeValue($name, $value);
                    if (!$result) {
                        throw new \Exception("Failed to set attribute: {$name}");
                    }
                }
            }

            DB::commit();

            return response()->json(
                $project->load(['attributeValues.attribute', 'users'])
            );
        } catch (ModelNotFoundException $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Project not found'
            ], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error updating project: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error updating project',
                'error' => config('app.debug') ? $e->getMessage() : 'Internal server error'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Remove the specified project from storage.
     *
     * @param string $id
     * @return JsonResponse
     */
    public function destroy(string $id): JsonResponse
    {
        try {
            $project = Project::findOrFail($id);
            $project->delete();

            return response()->json(null, Response::HTTP_NO_CONTENT);
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'message' => 'Project not found'
            ], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            Log::error('Error deleting project: ' . $e->getMessage());
            return response()->json([
                'message' => 'Error deleting project',
                'error' => config('app.debug') ? $e->getMessage() : 'Internal server error'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}