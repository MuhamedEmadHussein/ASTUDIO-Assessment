<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Timesheet;
use Illuminate\Http\Request;

class TimesheetController extends Controller
{
    public function index(Request $request)
    {
        $query = Timesheet::query();

        if ($request->has('filters')) {
            foreach ($request->filters as $key => $value) {
                $query->where($key, 'LIKE', "%$value%");
            }
        }

        if ($request->has('date_from')) {
            $query->where('date', '>=', $request->date_from);
        }

        if ($request->has('date_to')) {
            $query->where('date', '<=', $request->date_to);
        }

        return response()->json($query->with(['user', 'project'])->paginate());
    }

    public function store(Request $request)
    {
        $request->validate([
            'project_id' => 'required|exists:projects,id',
            'task_name' => 'required|string|max:255',
            'date' => 'required|date',
            'hours' => 'required|numeric|min:0|max:24'
        ]);

        $timesheet = $request->user()->timesheets()->create([
            'project_id' => $request->project_id,
            'task_name' => $request->task_name,
            'date' => $request->date,
            'hours' => $request->hours
        ]);

        return response()->json(
            $timesheet->load(['user', 'project']),
            201
        );
    }

    public function show(Timesheet $timesheet)
    {
        $this->authorize('view', $timesheet);

        return response()->json(
            $timesheet->load(['user', 'project'])
        );
    }

    public function update(Request $request, Timesheet $timesheet)
    {
        $this->authorize('update', $timesheet);

        $request->validate([
            'project_id' => 'required|exists:projects,id',
            'task_name' => 'required|string|max:255',
            'date' => 'required|date',
            'hours' => 'required|numeric|min:0|max:24'
        ]);

        $timesheet->update([
            'project_id' => $request->project_id,
            'task_name' => $request->task_name,
            'date' => $request->date,
            'hours' => $request->hours
        ]);

        return response()->json(
            $timesheet->load(['user', 'project'])
        );
    }

    public function destroy(Timesheet $timesheet)
    {
        $this->authorize('delete', $timesheet);

        $timesheet->delete();
        return response()->json(null, 204);
    }
}