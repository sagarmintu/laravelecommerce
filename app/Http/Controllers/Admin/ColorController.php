<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\ColorFromRequest;
use App\Models\Color;

class ColorController extends Controller
{
    public function index()
    {
        $colors = Color::all();
        return view('admin.colors.index', compact('colors'));
    }

    public function create()
    {
        return view('admin.colors.create');
    }

    public function store(ColorFromRequest $request)
    {
        $validatedData = $request->validated();
        $validatedData['status'] = $request->status == true ? '1':'0';
        Color::create($validatedData);
        return redirect('admin/colors')->with('message', 'Color Added Successfully');
    }

    public function edit(Color $color)
    {
        // return $color;
        return view('admin.colors.edit', compact('color'));
    }

    public function update(ColorFromRequest $request, $color_id)
    {
        $validatedData = $request->validated();
        $validatedData['status'] = $request->status == true ? '1':'0';
        Color::findorfail($color_id)->update($validatedData);
        return redirect('admin/colors')->with('message', 'Color Updated Successfully');
    }

    public function destroy($color_id)
    {
        $color = Color::findorfail($color_id);
        $color->delete();
        return redirect('admin/colors')->with('message', 'Color Deleted Successfully');
    }
}
