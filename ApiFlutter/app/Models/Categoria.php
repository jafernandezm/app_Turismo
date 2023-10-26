<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;

    // nombre , icono , descripcion , color1,color2
    protected $fillable = [
        'nombre',
        'icono',
        'color1',
        'color2',
        'descripcion',
    ];

    public function listas()
    {
        return $this->hasMany(Listas::class);
    }

}
