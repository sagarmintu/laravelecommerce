@extends('layouts.app')

@section('title', 'Order Progression')

@section('content')

<div class="py-3 py-md-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="shadow bg-white p-3">
                    <h4 class="text-primary"><i class="fa fa-shopping-cart text-dark"></i> Order Details</h4>
                    <hr>

                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <th>Order ID</th>
                                <th>Tracking No</th>
                                <th>Username</th>
                                <th>Payment Mode</th>
                                <th>Ordered Date</th>
                                <th>Status Message</th>
                            </thead>
                            <tbody>
                                @foreach ($order_Details as $orderItem)
                                    <tr>
                                        <td width="10%">{{ $orderItem->id }}</td>
                                        <td width="10%">{{ $orderItem->tracking_no }}</td>
                                        <td width="10%">{{ $orderItem->fullname }}</td>
                                        <td width="10%">{{ $orderItem->payment_mode }}</td>
                                        <td width="10%">{{ $orderItem->created_at->format('d-m-Y') }}</td>
                                        <td width="10%">{{ $orderItem->status_message }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection