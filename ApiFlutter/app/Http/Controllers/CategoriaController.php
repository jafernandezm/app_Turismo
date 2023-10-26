<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function index()
    {
        
        $categorias = Categoria::all();
        return response()->json($categorias);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $categoria = Categoria::create($request->all());
        return response()->json([
            'message' => 'Great success! New task created',
            'task' => $categoria
        
        ]);
    }
    public function show(Categoria $categoria)
    {
        //
    }

    public function edit(Categoria $categoria)
    {
        //
    }

    public function update(Request $request,$id)
    {
        $categoria = Categoria::find($id);
        $categoria->update($request->all());
        return response()->json($categoria);
    }

    public function destroy($id)
    {
        $categoria = Categoria::find($id);
        if (!$categoria) {
            return response()->json(['message' => 'Iglesia not found'], 404);
        }
        $categoria->delete();
        return response()->json(['message' => 'Iglesia deleted'], 204);
    }
}
