<?php

namespace App\Enums;

enum AttributeType: string
{
    case TEXT = 'text';
    case DATE = 'date';
    case NUMBER = 'number';
    case SELECT = 'select';

    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }

    public static function names(): array
    {
        return array_column(self::cases(), 'name');
    }
}