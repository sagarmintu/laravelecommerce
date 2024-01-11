<?php

namespace App\Http\Livewire\Frontend\Product;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;

class View extends Component
{
    public $category, $product, $prdColorSelectedQuantity;

    public function addToWishlist($productId)
    {
        // dd($productId);
        if (Auth::check())
        {
            // dd("I am in");
            if(Wishlist::where('user_id', auth()->user()->id)->where('product_id', $productId)->exists())
            {
                session()->flash('message', 'Already Added To Wishlist');
                return false;
            }
            else
            {
                Wishlist::create([
                    'user_id' => auth()->user()->id,
                    'product_id' => $productId
                ]);
                session()->flash('message', 'Wishlist Added Successfully');
            }
        }
        else
        {
            session()->flash('message', 'Please Login To Continue...');
            return false;
        }
    }
    public function colorSelected($productColorId)
    {
        // dd($productColorId);
        $productColor = $this->product->productColors()->where('id', $productColorId)->first();
        $this->prdColorSelectedQuantity = $productColor->quantity;

        if ($this->prdColorSelectedQuantity == 0)
        {
            $this->prdColorSelectedQuantity = 'outOfStock';
        }
    }
    public function mount($category, $product)
    {
        $this->category = $category;
        $this->product = $product;
    }
    public function render()
    {
        return view('livewire.frontend.product.view', [
            'category' =>$this->category,
            'product' =>$this->product,
        ]);
    }
}
