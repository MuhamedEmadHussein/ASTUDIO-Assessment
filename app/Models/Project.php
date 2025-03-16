<?php

namespace App\Models;

use App\Enums\ProjectStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Project extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    protected $casts = [
        'status' => ProjectStatus::class
    ];

    // Relationships
    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function timesheets()
    {
        return $this->hasMany(Timesheet::class);
    }

    public function attributeValues()
    {
        return $this->hasMany(AttributeValue::class);
    }

    // Scopes for filtering
    public function scopeStatus(Builder $query, ProjectStatus $status): Builder
    {
        return $query->where('status', $status);
    }

    public function scopeWithAttributeValue(Builder $query, string $attributeName, $value): Builder
    {
        return $query->whereHas('attributeValues', function ($query) use ($attributeName, $value) {
            $query->whereHas('attribute', function ($q) use ($attributeName) {
                $q->where('name', $attributeName);
            })->where('value', $value);
        });
    }

    // EAV Methods
    public function getAttributeValue($attributeName)
    {
        $attributeValue = $this->attributeValues()
            ->whereHas('attribute', function ($query) use ($attributeName) {
                $query->where('name', $attributeName);
            })
            ->with('attribute')
            ->first();

        if (!$attributeValue) {
            return null;
        }

        return $attributeValue->attribute->castValue($attributeValue->value);
    }

    public function setAttributeValue($attributeName, $value)
    {
        $attribute = Attribute::where('name', $attributeName)->first();
        if (!$attribute) {
            return false;
        }

        if (!$attribute->validateValue($value)) {
            return false;
        }

        return AttributeValue::updateOrCreate(
            [
                'project_id' => $this->id,
                'attribute_id' => $attribute->id
            ],
            ['value' => $attribute->formatValue($value)]
        );
    }
}