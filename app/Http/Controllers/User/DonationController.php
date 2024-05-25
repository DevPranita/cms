<?php

namespace App\Http\Controllers\User;

use App\Models\BasicExtra;
use App\Models\DonationDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DonationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $bex = BasicExtra::first();
        if ($bex->is_donation == 0) {
            return back();
        }

        $donations = DonationDetail::where('user_id',Auth::user()->id)->orderBy('id','DESC')->get();

        return view('user.donations',compact('donations'));

    }
}
