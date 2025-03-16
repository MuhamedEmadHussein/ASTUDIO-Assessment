<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTimesheetRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true; // Authorization will be handled by policies
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            'project_id' => ['required', 'exists:projects,id'],
            'task_name' => ['required', 'string', 'max:255'],
            'date' => ['required', 'date', 'before_or_equal:today'],
            'hours' => ['required', 'numeric', 'min:0.5', 'max:24'],
        ];

        // Add additional validation for bulk creation
        if ($this->isMethod('post') && $this->has('timesheets')) {
            $rules = [
                'timesheets' => ['required', 'array', 'min:1'],
                'timesheets.*.project_id' => ['required', 'exists:projects,id'],
                'timesheets.*.task_name' => ['required', 'string', 'max:255'],
                'timesheets.*.date' => ['required', 'date', 'before_or_equal:today'],
                'timesheets.*.hours' => ['required', 'numeric', 'min:0.5', 'max:24'],
            ];
        }

        return $rules;
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'project_id.required' => 'Project selection is required',
            'project_id.exists' => 'Selected project does not exist',
            'task_name.required' => 'Task name is required',
            'task_name.max' => 'Task name cannot be more than 255 characters',
            'date.required' => 'Date is required',
            'date.date' => 'Invalid date format',
            'date.before_or_equal' => 'Date cannot be in the future',
            'hours.required' => 'Hours are required',
            'hours.numeric' => 'Hours must be a number',
            'hours.min' => 'Hours must be at least 0.5',
            'hours.max' => 'Hours cannot exceed 24',
            'timesheets.required' => 'At least one timesheet entry is required',
            'timesheets.*.project_id.required' => 'Project selection is required for all entries',
            'timesheets.*.project_id.exists' => 'One or more selected projects do not exist',
            'timesheets.*.task_name.required' => 'Task name is required for all entries',
            'timesheets.*.date.required' => 'Date is required for all entries',
            'timesheets.*.hours.required' => 'Hours are required for all entries',
        ];
    }
}