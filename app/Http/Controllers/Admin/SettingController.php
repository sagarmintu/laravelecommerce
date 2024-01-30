<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;

class SettingController extends Controller
{
    public function index()
    {
        $settings = Setting::first();
        return view('admin.setting.index', compact('settings'));
    }

    public function store(Request $request)
    {
        $settings = Setting::first();
        if ($settings)
        {
            // Update Data
            $settings->update([
                'website_name' => $request->website_name,
                'website_url' => $request->website_url,
                'title' => $request->title,
                'meta_keywords' => $request->meta_keywords,
                'meta_description' => $request->meta_description,
                'address' => $request->address,
                'phone1' => $request->phone1,
                'phone2' => $request->phone2,
                'email1' => $request->email1,
                'email2' => $request->email2,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'instagram' => $request->instagram,
                'pinterest' => $request->pinterest
            ]);
            return redirect()->back()->with('message', 'Setting Information Data Updated !!!');
        }
        else
        {
            // Create Data
            Setting::create([
                'website_name' => $request->website_name,
                'website_url' => $request->website_url,
                'title' => $request->title,
                'meta_keywords' => $request->meta_keywords,
                'meta_description' => $request->meta_description,
                'address' => $request->address,
                'phone1' => $request->phone1,
                'phone2' => $request->phone2,
                'email1' => $request->email1,
                'email2' => $request->email2,
                'facebook' => $request->facebook,
                'twitter' => $request->twitter,
                'instagram' => $request->instagram,
                'pinterest' => $request->pinterest
            ]);

            return redirect()->back()->with('message', 'Setting Information Data Saved !!!');
        }
    }
}
