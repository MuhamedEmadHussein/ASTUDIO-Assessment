<?php

namespace App\Filters;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

class ProjectFilter
{
    protected $allowedOperators = ['=', '>', '<', 'LIKE', '>=', '<='];
    protected $defaultOperator = 'LIKE';
    protected $regularFields = ['name', 'status', 'created_at', 'updated_at'];

    public function apply(Builder $query, Request $request): Builder
    {
        if ($request->has('filters')) {
            foreach ($request->filters as $field => $filter) {
                // Handle operator-based filtering
                if (is_array($filter) && isset($filter['value'])) {
                    $operator = in_array($filter['operator'] ?? '', $this->allowedOperators)
                        ? $filter['operator']
                        : $this->defaultOperator;
                    $value = $filter['value'];
                } else {
                    $operator = $this->defaultOperator;
                    $value = $filter;
                }

                // Add wildcards for LIKE operator
                if ($operator === 'LIKE') {
                    $value = "%{$value}%";
                }

                // Apply filter based on field type
                if (in_array($field, $this->regularFields)) {
                    $query->where($field, $operator, $value);
                } else {
                    // Handle EAV attributes
                    $query->whereHas('attributeValues', function ($q) use ($field, $operator, $value) {
                        $q->whereHas('attribute', function ($attrQuery) use ($field) {
                            $attrQuery->where('name', $field);
                        })->where('value', $operator, $value);
                    });
                }
            }
        }

        return $query;
    }
}