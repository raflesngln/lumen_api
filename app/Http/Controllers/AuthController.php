<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }
    /**
     * Store a new user.
     *
     * @param  Request  $request
     * @return Response
     */
    public function register(Request $request)
    {
        //validate incoming request
        $this->validate($request, [
            'name' => 'required|string',
            'username' => 'required|string',
            'phone' => 'required',
            'address' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
        ]);

        try {

            $user = new User;
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->username = $request->input('username');
            $user->address = $request->input('address');
            $user->phone = $request->input('phone');
            $plainPassword = $request->input('password');
            $user->password = app('hash')->make($plainPassword);
            $user->save();

            //return successful response
            return response()->json(['user' => $user, 'message' => 'CREATED'], 201);

        } catch (\Exception $e) {
            //return error message
            return $e;
            // return response()->json(['message' => 'User Registration Failed!'], 409);
        }
    }
    public function login(Request $request)
    {
          //validate incoming request
        $this->validate($request, [
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = $request->only(['email', 'password']);

        if (! $token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function me()
    {
        return response()->json(auth()->user());
    }
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
    public function refresh()
    {
        // $credentials = $request->only('email', 'password');
        // if ($token = $this->guard()->attempt($credentials)) {
        //     return $this->respondWithToken($token);
        // }
        // return response()->json(['error' => 'Unauthorized'], 401);
        // return $this->respondWithToken($this->guard()->refresh());
        return $this->respondWithToken($this->guard()->refresh());
    }

    public function guard() {
        // return Auth::guard('api');
        return Auth::guard();
    }

}
