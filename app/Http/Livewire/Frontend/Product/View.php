<?php

namespace App\Http\Livewire\Frontend\Product;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;

class View extends Component
{
    public $category, $product, $prdColorSelectedQuantity, $quantityCount = 1;

    public function addToWishlist($productId)
    {
        // dd($productId);
        if (Auth::check())
        {
            // dd("I am in");
            if(Wishlist::where('user_id', auth()->user()->id)->where('product_id', $productId)->exists())
            {
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Already Added To Wishlist',
                    'type' => 'warning',
                    'status' => 409
                ]);
                return false;
            }
            else
            {
                Wishlist::create([
                    'user_id' => auth()->user()->id,
                    'product_id' => $productId
                ]);

                $this->emit('wishlistAddedOrUpdated');
                
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Wishlist Added Successfully',
                    'type' => 'success',
                    'status' => 200
                ]);
            }
        }
        else
        {
            $this->dispatchBrowserEvent('message', [
                'text' => 'Please Login To Continue...',
                'type' => 'error',
                'status' => 401
            ]);
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

    public function decrementQuantity()
    {
        if ($this->quantityCount > 1)
        {
            $this->quantityCount--;
        }
    }

    public function incrementQuantity()
    {
        if ($this->quantityCount < 10)
        {
            $this->quantityCount++;
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
