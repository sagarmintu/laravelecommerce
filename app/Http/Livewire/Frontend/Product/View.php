<?php

namespace App\Http\Livewire\Frontend\Product;

use Livewire\Component;

class View extends Component
{
    public $category, $product, $prdColorSelectedQuantity;

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
