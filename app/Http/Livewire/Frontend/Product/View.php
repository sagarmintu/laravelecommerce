<?php

namespace App\Http\Livewire\Frontend\Product;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use App\Models\Wishlist;
use App\Models\Cart;

class View extends Component
{
    public $category, $product, $prdColorSelectedQuantity, $quantityCount = 1, $productColorId;

    public function addToWishlist($productId)
    {
        // dd($productId);
        if (Auth::check()) {
            // dd("I am in");
            if (Wishlist::where('user_id', auth()->user()->id)->where('product_id', $productId)->exists()) {
                $this->dispatchBrowserEvent('message', [
                    'text' => 'Already Added To Wishlist',
                    'type' => 'warning',
                    'status' => 409
                ]);
                return false;
            } else {
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
        } else {
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
        $this->productColorId = $productColorId;
        $productColor = $this->product->productColors()->where('id', $productColorId)->first();
        $this->prdColorSelectedQuantity = $productColor->quantity;

        if ($this->prdColorSelectedQuantity == 0) {
            $this->prdColorSelectedQuantity = 'outOfStock';
        }
    }

    public function decrementQuantity()
    {
        if ($this->quantityCount > 1) {
            $this->quantityCount--;
        }
    }

    public function incrementQuantity()
    {
        if ($this->quantityCount < 10) {
            $this->quantityCount++;
        }
    }

    public function addToCart(int $productId)
    {
        if (Auth::check()) {
            // dd("am in");
            // dd($productId);
            if ($this->product->where('id', $productId)->where('status', '0')->exists()) {
                // dd("am product");

                // Check for the product color quantity and insert to the cart
                if($this->product->productColors()->count() > 1)
                {
                    // dd('product color quantity');
                    if ($this->prdColorSelectedQuantity !=NULL)
                    {
                        // dd('color selected');
                        if (Cart::where('user_id',auth()->user()->id)->where('product_id',$productId)->where('product_color_id',$this->productColorId)->exists())
                        {
                            $this->dispatchBrowserEvent('message', [
                                'text' => 'Product Already Added',
                                'type' => 'warning',
                                'status' => 200
                            ]);
                        }
                        else
                        {
                            $productColor = $this->product->productColors()->where('id',$this->productColorId)->first();
                            if ($productColor->quantity > 0)
                            {
                                if ($productColor->quantity > $this->quantityCount) 
                                {
                                    // dd('am add to cart with colors');
                                    //  Insert product to cart with colors
                                    Cart::create([
                                        'user_id' => auth()->user()->id,
                                        'product_id' => $productId,
                                        'product_color_id' => $this->productColorId,
                                        'quantity' => $this->quantityCount
                                    ]);
                                    $this->emit('CartAddedOrUpdated');
                                    $this->dispatchBrowserEvent('message', [
                                        'text' => 'Product Added To Cart',
                                        'type' => 'success',
                                        'status' => 200
                                    ]);
                                } 
                                else 
                                {
                                    $this->dispatchBrowserEvent('message', [
                                        'text' => 'only '.$productColor->quantity.' Quantity Available',
                                        'type' => 'warning',
                                        'status' => 404
                                    ]);
                                }
                            }
                            else
                            {
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'Out Of Stock',
                                    'type' => 'warning',
                                    'status' => 404
                                ]);
                            }
                        }
                    }
                    else
                    {
                        $this->dispatchBrowserEvent('message', [
                            'text' => 'Select Your Product Color',
                            'type' => 'info',
                            'status' => 404
                        ]);
                    }
                }
                else
                {
                    if (Cart::where('user_id',auth()->user()->id)->where('product_id',$productId)->exists())
                    {
                        $this->dispatchBrowserEvent('message', [
                            'text' => 'Product Already Added',
                            'type' => 'warning',
                            'status' => 200
                        ]);
                    }
                    else
                    {
                        if ($this->product->quantity > 0) 
                        {
                            if ($this->product->quantity > $this->quantityCount) 
                            {
                                // dd('am add to cart without colors');
                                //  Insert product to cart
                                Cart::create([
                                    'user_id' => auth()->user()->id,
                                    'product_id' => $productId,
                                    'quantity' => $this->quantityCount
                                ]);
                                $this->emit('CartAddedOrUpdated');
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'Product Added To Cart',
                                    'type' => 'success',
                                    'status' => 200
                                ]);
                            } 
                            else 
                            {
                                $this->dispatchBrowserEvent('message', [
                                    'text' => 'only '.$this->product->quantity.' Quantity Present',
                                    'type' => 'warning',
                                    'status' => 404
                                ]);
                            }
                        } 
                        else 
                        {
                            $this->dispatchBrowserEvent('message', [
                                'text' => 'Out Of Stock',
                                'type' => 'warning',
                                'status' => 404
                            ]);
                        }
                    }
                }
            } else {
                $this->dispatchBrowserEvent('message', [
                    'text' => 'No Product Available',
                    'type' => 'warning',
                    'status' => 404
                ]);
            }
        } else {
            $this->dispatchBrowserEvent('message', [
                'text' => 'Please Login To Add To Cart',
                'type' => 'error',
                'status' => 401
            ]);
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
            'category' => $this->category,
            'product' => $this->product,
        ]);
    }
}
