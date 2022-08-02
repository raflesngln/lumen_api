<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function index()
    {
        $users = User::all();

        return response()->json([
            'success' => true,
            'message' =>'List Semua User',
            'data'    => $users
        ], 200);
    }
public function store(Request $request)
{
    $validator = Validator::make($request->all(), [
        'username'   => 'required',
        'password' => 'required',
    ]);

    if ($validator->fails()) {

        return response()->json([
            'success' => false,
            'message' => 'Username and password Wajib Diisi!',
            'data'   => $validator->errors()
        ],401);

    } else {

        $user = User::create([
            'username'     => $request->input('username'),
            'password'   => $request->input('password'),
            'phone'   => $request->input('phone'),
            'address'   => $request->input('address'),

        ]);

        if ($user) {
            return response()->json([
                'success' => true,
                'message' => 'User Berhasil Disimpan!',
                'data' => $user
            ], 201);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'User Gagal Disimpan!',
            ], 400);
        }

    }
}
public function show($id)
{
    // $username='mawar';
    // $user = User::where('username', $username)->first();
   $user = User::find($id);
   if ($user) {
       return response()->json([
           'success'   => true,
           'message'   => 'Detail Users',
           'data'      => $user
       ], 200);
   } else {
       return response()->json([
           'success' => false,
           'message' => 'User Tidak Ditemukan!',
       ], 404);
   }
}
public function update(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'username'   => 'required',
        'password' => 'required',
    ]);

    if ($validator->fails()) {

        return response()->json([
            'success' => false,
            'message' => 'Semua Kolom Wajib Diisi!',
            'data'   => $validator->errors()
        ],401);

    } else {

        $user = User::whereId($id)->update([
            'username'     => $request->input('username'),
            'password'   => $request->input('password'),
            'phone'   => $request->input('phone'),
            'address'   => $request->input('address'),
        ]);

        if ($user) {
            return response()->json([
                'success' => true,
                'message' => 'User Berhasil Diupdate!',
                'data' => $user
            ], 201);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'User Gagal Diupdate!',
            ], 400);
        }

    }
}

public function destroy($id)
{
    $user = User::whereId($id)->first();
    $user->delete();
    if ($user) {
        return response()->json([
            'success' => true,
            'message' => 'User Berhasil Dihapus!',
        ], 200);
    }

}

}