<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Enums\AttributeType;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Enum;

class AttributeController extends Controller
{
    public function index(Request $request)
    {
        $query = Attribute::query();

        if ($request->has('type')) {
            $query->where('type', $request->type);
        }

        return response()->json($query->paginate());
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:attributes',
            'type' => ['required', new Enum(AttributeType::class)],
            'options' => 'required_if:type,select|array'
        ]);

        $attribute = Attribute::create([
            'name' => $request->name,
            'type' => $request->type,
            'options' => $request->type === AttributeType::SELECT->value ? $request->options : null
        ]);

        return response()->json($attribute, 201);
    }

    public function show(Attribute $attribute)
    {
        return response()->json($attribute);
    }

    public function update(Request $request, Attribute $attribute)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:attributes,name,' . $attribute->id,
            'type' => ['required', new Enum(AttributeType::class)],
            'options' => 'required_if:type,select|array'
        ]);

        $attribute->update([
            'name' => $request->name,
            'type' => $request->type,
            'options' => $request->type === AttributeType::SELECT->value ? $request->options : null
        ]);

        return response()->json($attribute);
    }

    public function destroy(Attribute $attribute)
    {
        $attribute->delete();
        return response()->json(null, 204);
    }
}