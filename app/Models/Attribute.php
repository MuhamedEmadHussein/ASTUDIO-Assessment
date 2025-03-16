<?php

namespace App\Models;

use App\Enums\AttributeType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attribute extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'type',
        'options' // For SELECT type attributes
    ];

    protected $casts = [
        'type' => AttributeType::class,
        'options' => 'array'
    ];

    public function values()
    {
        return $this->hasMany(AttributeValue::class);
    }

    public function validateValue($value): bool
    {
        return match($this->type) {
            AttributeType::NUMBER => is_numeric($value),
            AttributeType::DATE => strtotime($value) !== false,
            AttributeType::SELECT => is_array($this->options) && in_array($value, $this->options),
            AttributeType::TEXT => is_string($value),
        };
    }

    public function formatValue($value): string
    {
        return match($this->type) {
            AttributeType::DATE => $value instanceof \DateTime ? $value->format('Y-m-d') : $value,
            default => (string) $value,
        };
    }

    public function castValue($value)
    {
        return match($this->type) {
            AttributeType::NUMBER => (float) $value,
            AttributeType::DATE => new \DateTime($value),
            AttributeType::SELECT, AttributeType::TEXT => (string) $value,
        };
    }
}