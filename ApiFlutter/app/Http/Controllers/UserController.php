<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()->json($users);
    }
    public function store(Request $request)
    {
         //
         $user = User::create($request->all());
         return response()->json($user);
    }

    public function login(Request $request){

        $user = User::where('email', $request->email)->first();

        if($user->password == $request->password){
            return response()->json(['message' => 'exito',
                                     'user' => $user   ]);
        }else{
            return response()->json(['message' => 'falso'
        ]);
        }
    }

    public function update(Request $request,$id)
    {
        $user = User::find($id);
        $user->update($request->all());
        return response()->json($user);
    }
    public function destroy($id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json(['message' => 'user not found'], 404);
        }
        $user->delete();
        return response()->json(['message' => 'user deleted'], user);
    }
}
