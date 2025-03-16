<?php

namespace App\Http\Requests;

use App\Enums\ProjectStatus;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Enum;

class StoreProjectRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'status' => ['required', new Enum(ProjectStatus::class)],
            'attributes' => ['sometimes', 'array'],
            'attributes.*' => ['required'],
            'user_ids' => ['sometimes', 'array'],
            'user_ids.*' => ['required', 'exists:users,id'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'name.required' => 'A project name is required',
            'name.max' => 'Project name cannot be more than 255 characters',
            'status.required' => 'Project status is required',
            'user_ids.*.exists' => 'One or more selected users do not exist',
        ];
    }
}