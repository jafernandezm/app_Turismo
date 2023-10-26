<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Listas extends Model
{
    use HasFactory;

    //nombre , descripcion,direccion, img
    protected $fillable = [
        'nombre',
        'descripcion',
        'direccion',
        'img',
        'categoria_id',
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
    
}
