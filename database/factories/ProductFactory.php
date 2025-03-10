<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Product;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->word, 
            'description' => $this->faker->sentence,
            'price' => $this->faker->randomFloat(2, 100, 1000), 
            'stock' => $this->faker->numberBetween(1, 50),
        ];
    }
}
