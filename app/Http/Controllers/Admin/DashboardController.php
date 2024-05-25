<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Quote;
use App\Models\Product;
use App\Models\ProductOrder;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $data['quotes'] = Quote::orderBy('id', 'DESC')->limit(10)->get();
        $data['porders'] = ProductOrder::orderBy('id', 'DESC')->limit(10)->get();
        $data['default'] = Language::where('is_default', 1)->first();
        return view('admin.dashboard', $data);
    }
}
