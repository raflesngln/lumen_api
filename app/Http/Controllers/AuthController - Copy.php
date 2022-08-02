<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Validator;
use App\Models\Users;
use App\Userlogin;

use Illuminate\Contracts\Encryption\DecryptException;

class AuthController extends Controller
{
    
    public function login(Request $request)
    {
        
        $input = json_decode(request()->getContent(), true);
        $username=$input['username'];
        $password=$input['password'];


        // $validator = Validator::make($request->all(), [
        $validator = Validator::make($input, [
            'username' => 'required|min:4',
            'password' => 'required|min:6'
        ],[
            'required'  => ':attribute harus di isis=> '.$input['username'],
            'min'       => ':attribute minimal :min karakter',
        ]);

        if ($validator->fails()) {
            $resp = [
                'metadata' => [
                        'message' => $validator->errors()->first(),
                        'code'    => 422
                    ]
                ];
            return response()->json($resp, 422);
            die();
        }

        $user = Userlogin::where('username', $input['username'])->first();

        $pwd=$user->password;
        $plainpass = Crypt::decrypt($pwd);

        if($user)
        {
            if($plainpass==$password)
            {
                
                $token = \Auth::login($user);
                $resp = [
                    'response' => [
                        'token'=> $token  
                    ],
                    'metadata' => [
                        'message' => 'OK',
                        'code'    => 200
                    ]
                ];

                return response()->json($resp);
            }else{

                $resp = [
                    'metadata' => [
                        'message' => 'Username Atau Password Tidak Sesuaias',
                        'code'    => 401
                    ]
                ];

                return response()->json($resp, 401);
            }
        }else{
            $resp = [
                'metadata' => [
                    'message' => 'Username Atau Password Tidak SesuaiSS => ',
                    'code'    => 401
                ]
            ];

            return response()->json($resp, 401);
        }

    }

}