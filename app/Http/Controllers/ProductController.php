<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
/**
 * @OA\Info(
 *     title="Laravel Products API",
 *     version="1.0.0",
 *     description="API for managing products in a Laravel application."
 * )
 */
class ProductController extends Controller
{
    /**
 * @OA\Get(
 *     path="/api/products",
 *     summary="Get all products",
 *     tags={"Products"},
 *     @OA\Response(
 *         response=200,
 *         description="List of products",
 *         @OA\JsonContent(
 *             type="array",
 *             @OA\Items(ref="#/components/schemas/Product")
 *         )
 *     )
 * )
 */
    public function index()
    {
        return response()->json([
            'message' => 'Products retrieved successfully!',
            'title' => 'Success',
            'data' => Product::all()
        ], 200);
    }
 
    /**
     * @OA\Post(
     *     path="/api/products",
     *     summary="Create a new product",
     *     tags={"Products"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/Product")
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Product created successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *             @OA\Property(property="title", type="string"),
     *             @OA\Property(property="data", ref="#/components/schemas/Product")
     *         )
     *     )
     * )
     */
    // Store Product
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric',
            'stock' => 'required|integer',
        ]);

        $product = Product::create($request->all());

        return response()->json([
            'message' => 'Product created successfully!',
            'title' => 'Success',
            'data' => $product
        ], 201);
    }

    
    /**
     * @OA\Get(
     *     path="/api/products/{id}",
     *     summary="Get a single product",
     *     tags={"Products"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID of the product",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Product details",
     *         @OA\JsonContent(ref="#/components/schemas/Product")
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Product not found"
     *     )
     * )
     */
    // Show Product by ID
    public function show($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'message' => 'Product Not Found',
                'title' => 'Error',
                'data' => null
            ], 404);
        }
        return response()->json([
            'message' => 'Product retrieved successfully!',
            'title' => 'Success',
            'data' => $product
        ], 200);
    }

    /**
     * @OA\Put(
     *     path="/api/products/{id}",
     *     summary="Update a product",
     *     tags={"Products"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID of the product",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(ref="#/components/schemas/Product")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Product updated successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *             @OA\Property(property="title", type="string"),
     *             @OA\Property(property="data", ref="#/components/schemas/Product")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Product not found"
     *     )
     * )
     */
    // Update Product
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'message' => 'Product Not Found',
                'title' => 'Error',
                'data' => null
            ], 404);
        }

        $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'price' => 'sometimes|required|numeric',
            'stock' => 'sometimes|required|integer',
        ]);

        $product->update($request->all());

        return response()->json([
            'message' => 'Product updated successfully!',
            'title' => 'Success',
            'data' => $product
        ], 200);
    }

    /**
     * @OA\Delete(
     *     path="/api/products/{id}",
     *     summary="Delete a product",
     *     tags={"Products"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID of the product",
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Product deleted successfully",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string"),
     *             @OA\Property(property="title", type="string"),
     *             @OA\Property(property="data", type="null")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Product not found"
     *     )
     * )
     */
    // Delete Product
    public function destroy($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'message' => 'Product Not Found',
                'title' => 'Error',
                'data' => null
            ], 404);
        }

        $product->delete();
        return response()->json([
            'message' => 'Product deleted successfully!',
            'title' => 'Success',
            'data' => null
        ], 200);
    }
}
