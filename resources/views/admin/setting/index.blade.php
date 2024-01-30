@extends('layouts.admin')

@section('title', 'Admin Setting')

@section('content')

<div class="row">
    <div class="col-md-12 grid-margin">

        @if(session('message'))
            <div class="alert alert-success mb-4">{{ session('message') }}</div>
        @endif

        <form action="{{ url('admin/settings') }}" method="post">
            @csrf

            <div class="card mb-3">
                <div class="card-header bg-primary">
                    <h3 class="text-white mb-0">Website</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Website Name</label>
                            <input type="text" name="website_name" class="form-control" value="{{ $settings->website_name ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Website URL</label>
                            <input type="text" name="website_url" class="form-control" value="{{ $settings->website_url ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Page Title</label>
                            <input type="text" name="title" class="form-control" value="{{ $settings->title ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Meta Keywords</label>
                            <textarea name="meta_keywords" class="form-control" rows="3">{{ $settings->meta_keywords ?? '' }}</textarea>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Meta Description</label>
                            <textarea name="meta_description" class="form-control" rows="3">{{ $settings->meta_description ?? '' }}</textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-header bg-primary">
                    <h3 class="text-white mb-0">Website - Information</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Address</label>
                            <textarea name="address" class="form-control" rows="3">{{ $settings->address ?? '' }}</textarea>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Phone 1*</label>
                            <input type="text" name="phone1" class="form-control" value="{{ $settings->phone1 ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Phone 2*</label>
                            <input type="text" name="phone2" class="form-control" value="{{ $settings->phone2 ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Email Id 1*</label>
                            <input type="email" name="email1" class="form-control" value="{{ $settings->email1 ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Email Id 2*</label>
                            <input type="email" name="email2" class="form-control" value="{{ $settings->email2 ?? '' }}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-3">
                <div class="card-header bg-primary">
                    <h3 class="text-white mb-0">Website - Socail Media</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Facebook (optional)</label>
                            <input type="text" name="facebook" class="form-control" value="{{ $settings->facebook ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Twitter (optional)</label>
                            <input type="text" name="twitter" class="form-control" value="{{ $settings->twitter ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Instagram (optional)</label>
                            <input type="text" name="instagram" class="form-control" value="{{ $settings->instagram ?? '' }}">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Pinterest (optional)</label>
                            <input type="text" name="pinterest" class="form-control" value="{{ $settings->pinterest ?? '' }}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-primary text-white">Save Settings</button>
            </div>

        </form>
    </div>
</div>

@endsection