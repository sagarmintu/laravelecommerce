<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Carbon;

class OrderController extends Controller
{
    public function index()
    {
        $todayDate = Carbon::now();
        $orders = Order::whereDate('created_at', $todayDate)->paginate(10);
        return view('admin.orders.index', compact('orders'));
    }

    public function show(int $orderId)
    {
        $order = Order::where('id', $orderId)->first();
        if($order)
        {
            return view('admin.orders.view', compact('order'));
        }
        else
        {
            return redirect('admin/orders')->with('message', 'Order Id Not Found !!!');
        }
    }
}
