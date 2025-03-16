<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'status'];
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
        return $this->hasMany(AttributeValue::class, 'entity_id');
    }

    public function getAttributeValue($attributeName)
    {
        return $this->attributeValues()
            ->whereHas('attribute', function ($query) use ($attributeName) {
                $query->where('name', $attributeName);
            })
            ->first()?->value;
    }

    public function setAttributeValue($attributeName, $value)
    {
        $attribute = Attribute::where('name', $attributeName)->first();
        if (!$attribute) {
            return false;
        }

        return AttributeValue::updateOrCreate(
            ['entity_id' => $this->id, 'attribute_id' => $attribute->id],
            ['value' => $value]
        );
    }
}