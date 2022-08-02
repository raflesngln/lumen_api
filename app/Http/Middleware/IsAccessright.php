<?php

namespace App\Http\Middleware;



use Closure;

class IsAccessright
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // $AuthToken = $_SERVER['HTTP_AUTHORIZATION'];
        $AuthToken=$request->header('Authorization');
        $usrpas = base64_decode(str_replace('Basic ','',$AuthToken));

        $user = \App\User::where('username', $request->username)->first();
        $usr_pas_base64='Basic '.base64_encode($user->username.':'.$user->password);

        if ($AuthToken ==$usr_pas_base64) {
             return $next($request);
        } else{
            return 'Anda Tidak berhak masuk karna login anda salah !!'.$usr_pas_base64;
            exit();
           
        }
        


        // if ($request->userlogin != 'raflesngln') {
        //     return "Anda tidak di ijinkan masuk, hanya username raflesngln saja.";
        // }
        // return $next($request);

    }
}
