<?php

namespace App\Http\Controllers;

use App\Models\Listas;
use Illuminate\Http\Request;

class ListasController extends Controller
{
    public function index()
    {
        $Listas = Listas::all();
        return response()->json($Listas);
    }
    public function subirImagen(Request $request)
    {
        if ($request->hasFile('imagen')) {
            $imagen = $request->file('imagen');
            $nombre_archivo = $imagen->getClientOriginalName();
            $ruta_guardado = 'img/' . $nombre_archivo;
            $imagen->move('img/', $nombre_archivo);
            // Realiza las operaciones adicionales necesarias
            return response()->json(['mensaje' => 'Imagen subida exitosamente',
                                     'ruta' => $ruta_guardado
                                    ], 200);
        } else {
            return response()->json(['mensaje' => 'No se encontró ninguna imagen en la solicitud'], 400);
        }
    }
    public function listarPorCategoria($id)
    {
        $listas = Listas::where('categoria_id', $id)->get();
        return response()->json($listas);
    }
    


    public function store(Request $request)
    {
        $listas = Listas::create($request->all());
        return response()->json([
            'message' => 'Great success! New task created',
            'task' => $listas
        ]);
    }



    public function update(Request $request,$id)
    {
        $listas = Listas::find($id);
        $listas->update($request->all());
        return response()->json($listas);
    }

    public function destroy($id)
    {
        $listas = Listas::find($id);
        if (!$listas) {
            return response()->json(['message' => 'Iglesia not found'], 404);
        }
        $listas->delete();
        return response()->json(['message' => 'Iglesia deleted'], 204);
    }

    public function create()
    {
        //
    }
    public function show(Listas $listas)
    {
        //
    }

    public function edit(Listas $listas)
    {
        //
    }
}
