# Laravel Products API Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [API Overview](#api-overview)
3. [Data Model](#data-model)
4. [API Endpoints](#api-endpoints)
   - [List All Products](#list-all-products)
   - [Create a Product](#create-a-product)
   - [Get a Single Product](#get-a-single-product)
   - [Update a Product](#update-a-product)
   - [Delete a Product](#delete-a-product)
5. [Error Handling](#error-handling)
6. [Implementation Details](#implementation-details)
   - [Controller](#controller)
   - [Model](#model)
   - [Database Migration](#database-migration)
   - [Routes](#routes)
7. [Recommendations](#recommendations)

---

## 1. Introduction <a name="introduction"></a>

This document provides comprehensive technical documentation for the Laravel Products API. This RESTful API enables clients to perform CRUD (Create, Read, Update, Delete) operations on product resources within a Laravel application. The API is designed to be used as part of an e-commerce system and provides a standardized way to manage product data.

The intended audiences for this documentation are:
- Backend developers implementing client applications
- Frontend developers integrating with the API
- System administrators setting up the API
- QA engineers testing the API endpoints

---

## 2. API Overview <a name="api-overview"></a>

The Laravel Products API follows RESTful principles and uses JSON for data exchange. All responses follow a consistent format with message, title, and data fields.

- **Base URL:** `http://localhost/ecommerce_ByteQuest`
- **API Prefix:** `/api`
- **Full API Base URL:** `http://localhost/ecommerce_ByteQuest/api`
- **Content Type:** `application/json`
- **Protocol:** HTTP/HTTPS

**Standard Response Format:**
```json
{
  "message": "Status message",
  "title": "Response title (Success/Error)",
  "data": null or JSON object/array
}
```

**Authentication:**
The API currently does not implement authentication. It is recommended to implement authentication in production environments.

**Request Rate Limiting:**
There are currently no rate limits implemented.

---

## 3. Data Model <a name="data-model"></a>

### Product

The core entity in this API is the Product, which represents items available in an e-commerce system.

#### Database Schema

| Field       | Type          | Description                          | Constraints                |
|-------------|---------------|--------------------------------------|-----------------------------|
| id          | Integer       | Unique identifier for the product    | Auto-increment, Primary Key |
| name        | String        | Name of the product                  | Required, Max: 255 chars    |
| description | Text          | Detailed description of the product  | Optional, Nullable          |
| price       | Decimal(8,2)  | Price of the product                 | Required, Numeric           |
| stock       | Integer       | Available quantity in stock          | Required, Integer           |
| created_at  | Timestamp     | When the product was created         | Auto-generated              |
| updated_at  | Timestamp     | When the product was last updated    | Auto-updated                |

#### Data Validation Rules

- **name**: 
  - Required
  - String
  - Maximum 255 characters
- **price**: 
  - Required
  - Numeric value
  - Precision of 8 digits with 2 decimal places
- **stock**: 
  - Required
  - Integer value
- **description**: 
  - Optional
  - Can be null
  - Text field with no character limit

---

## 4. API Endpoints <a name="api-endpoints"></a>

### List All Products <a name="list-all-products"></a>

Retrieves a list of all products stored in the database.

**Request:**
- **URL:** `http://localhost/ecommerce_ByteQuest/api/products`
- **Method:** `GET`
- **Headers:**
  - Content-Type: application/json
  - Accept: application/json
- **URL Parameters:** None
- **Query Parameters:** None
- **Body:** None

**Response:**
- **Status Code:** 200 OK
- **Body:**
  ```json
  {
    "message": "Products retrieved successfully!",
    "title": "Success",
    "data": [
      {
        "id": 1,
        "name": "Product 1",
        "description": "Product description",
        "price": 99.99,
        "stock": 100,
        "created_at": "2025-03-02T12:00:00.000000Z",
        "updated_at": "2025-03-02T12:00:00.000000Z"
      },
      {
        "id": 2,
        "name": "Product 2",
        "description": "Another product description",
        "price": 149.99,
        "stock": 50,
        "created_at": "2025-03-02T12:00:00.000000Z",
        "updated_at": "2025-03-02T12:00:00.000000Z"
      }
    ]
  }
  ```

**Notes:**
- This endpoint returns all products without pagination
- If no products exist, the `data` field will be an empty array (`[]`)
- The response is ordered by product ID by default

**Sample Request using cURL:**
```bash
curl -X GET \
  http://localhost/ecommerce_ByteQuest/api/products \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json'
```

### Create a Product <a name="create-a-product"></a>

Creates a new product in the database.

**Request:**
- **URL:** `http://localhost/ecommerce_ByteQuest/api/products`
- **Method:** `POST`
- **Headers:**
  - Content-Type: application/json
  - Accept: application/json
- **URL Parameters:** None
- **Body:**
  ```json
  {
    "name": "New Product",
    "description": "Product description",
    "price": 199.99,
    "stock": 75
  }
  ```

**Required Fields:**
- `name` (string): Product name
- `price` (numeric): Product price
- `stock` (integer): Available quantity

**Optional Fields:**
- `description` (string): Product description

**Response:**
- **Status Code:** 201 Created
- **Body:**
  ```json
  {
    "message": "Product created successfully!",
    "title": "Success",
    "data": {
      "id": 3,
      "name": "New Product",
      "description": "Product description",
      "price": 199.99,
      "stock": 75,
      "created_at": "2025-03-02T12:00:00.000000Z",
      "updated_at": "2025-03-02T12:00:00.000000Z"
    }
  }
  ```

**Error Responses:**
- **Status Code:** 422 Unprocessable Entity (Validation Error)
- **Body:**
  ```json
  {
    "message": "The given data was invalid.",
    "errors": {
      "name": [
        "The name field is required."
      ],
      "price": [
        "The price field is required."
      ],
      "stock": [
        "The stock field is required."
      ]
    }
  }
  ```

**Sample Request using cURL:**
```bash
curl -X POST \
  http://localhost/ecommerce_ByteQuest/api/products \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "New Product",
    "description": "Product description",
    "price": 199.99,
    "stock": 75
}'
```

### Get a Single Product <a name="get-a-single-product"></a>

Retrieves a specific product by its ID.

**Request:**
- **URL:** `http://localhost/ecommerce_ByteQuest/api/products/{id}`
- **Method:** `GET`
- **Headers:**
  - Content-Type: application/json
  - Accept: application/json
- **URL Parameters:** 
  - `id`: The ID of the product to retrieve (integer)
- **Body:** None

**Response:**
- **Status Code:** 200 OK
- **Body:**
  ```json
  {
    "message": "Product retrieved successfully!",
    "title": "Success",
    "data": {
      "id": 1,
      "name": "Product 1",
      "description": "Product description",
      "price": 99.99,
      "stock": 100,
      "created_at": "2025-03-02T12:00:00.000000Z",
      "updated_at": "2025-03-02T12:00:00.000000Z"
    }
  }
  ```

**Error Response:**
- **Status Code:** 404 Not Found
- **Body:**
  ```json
  {
    "message": "Product Not Found",
    "title": "Error",
    "data": null
  }
  ```

**Sample Request using cURL:**
```bash
curl -X GET \
  http://localhost/ecommerce_ByteQuest/api/products/1 \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json'
```

### Update a Product <a name="update-a-product"></a>

Updates an existing product by its ID.

**Request:**
- **URL:** `http://localhost/ecommerce_ByteQuest/api/products/{id}`
- **Method:** `PUT` or `PATCH`
- **Headers:**
  - Content-Type: application/json
  - Accept: application/json
- **URL Parameters:**
  - `id`: The ID of the product to update (integer)
- **Body:**
  ```json
  {
    "name": "Updated Product Name",
    "price": 129.99,
    "stock": 200
  }
  ```

**Optional Fields (at least one required):**
- `name` (string): Product name
- `description` (string): Product description
- `price` (numeric): Product price
- `stock` (integer): Available quantity

**Notes:**
- Only include fields you want to update
- The `sometimes|required` validation rule means fields are optional in the request, but if provided, they must meet the validation rules

**Response:**
- **Status Code:** 200 OK
- **Body:**
  ```json
  {
    "message": "Product updated successfully!",
    "title": "Success",
    "data": {
      "id": 1,
      "name": "Updated Product Name",
      "description": "Product description",
      "price": 129.99,
      "stock": 200,
      "created_at": "2025-03-02T12:00:00.000000Z",
      "updated_at": "2025-03-02T12:15:00.000000Z"
    }
  }
  ```

**Error Responses:**
- **Status Code:** 404 Not Found
- **Body:**
  ```json
  {
    "message": "Product Not Found",
    "title": "Error",
    "data": null
  }
  ```

- **Status Code:** 422 Unprocessable Entity (Validation Error)
- **Body:**
  ```json
  {
    "message": "The given data was invalid.",
    "errors": {
      "price": [
        "The price must be a number."
      ]
    }
  }
  ```

**Sample Request using cURL:**
```bash
curl -X PUT \
  http://localhost/ecommerce_ByteQuest/api/products/1 \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Updated Product Name",
    "price": 129.99,
    "stock": 200
}'
```

### Delete a Product <a name="delete-a-product"></a>

Deletes a specific product by its ID.

**Request:**
- **URL:** `http://localhost/ecommerce_ByteQuest/api/products/{id}`
- **Method:** `DELETE`
- **Headers:**
  - Content-Type: application/json
  - Accept: application/json
- **URL Parameters:**
  - `id`: The ID of the product to delete (integer)
- **Body:** None

**Response:**
- **Status Code:** 200 OK
- **Body:**
  ```json
  {
    "message": "Product deleted successfully!",
    "title": "Success",
    "data": null
  }
  ```

**Error Response:**
- **Status Code:** 404 Not Found
- **Body:**
  ```json
  {
    "message": "Product Not Found",
    "title": "Error",
    "data": null
  }
  ```

**Sample Request using cURL:**
```bash
curl -X DELETE \
  http://localhost/ecommerce_ByteQuest/api/products/1 \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json'
```

---

## 5. Error Handling <a name="error-handling"></a>

The API uses standard HTTP status codes and provides detailed error messages to help clients understand and resolve issues.

### HTTP Status Codes

| Status Code | Name                 | Description                                            |
|-------------|----------------------|--------------------------------------------------------|
| 200         | OK                   | Request was successful                                 |
| 201         | Created              | Resource was successfully created                      |
| 404         | Not Found            | The requested resource could not be found              |
| 422         | Unprocessable Entity | Request contains invalid data (validation errors)      |
| 500         | Server Error         | An unexpected error occurred on the server             |

### Error Response Structure

All error responses follow a consistent format:

```json
{
  "message": "Error message describing the problem",
  "title": "Error",
  "data": null
}
```

For validation errors (422 Unprocessable Entity), the response will include detailed information about which fields failed validation:

```json
{
  "message": "The given data was invalid.",
  "errors": {
    "field_name": [
      "Error message for this field"
    ]
  }
}
```

### Common Error Scenarios

1. **Resource Not Found (404)**
   - Attempting to retrieve, update, or delete a product that doesn't exist

2. **Validation Errors (422)**
   - Missing required fields when creating a product
   - Invalid data types (e.g., string for price instead of numeric)
   - Values exceeding maximum lengths

3. **Server Errors (500)**
   - Database connection issues
   - Code exceptions

---

## 6. Implementation Details <a name="implementation-details"></a>

### Controller <a name="controller"></a>

The API is implemented using Laravel's `ProductController` which handles all CRUD operations for products.

```php
<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // Get All Products
    public function index()
    {
        return response()->json([
            'message' => 'Products retrieved successfully!',
            'title' => 'Success',
            'data' => Product::all()
        ], 200);
    }

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
```

### Model <a name="model"></a>

The `Product` model defines the database structure and fillable fields.

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'price',
        'stock',
    ];
}
```

#### Key Model Features

- Uses Laravel's Eloquent ORM
- Implements `HasFactory` trait for model factories (useful for testing and seeding)
- Defines `$fillable` property to specify which attributes can be mass-assigned

### Database Migration <a name="database-migration"></a>

The products table is created using a Laravel migration:

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->decimal('price', 8, 2);
            $table->integer('stock');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
```

#### Migration Details

- Creates a table named `products`
- Defines columns for all product attributes
- Makes `description` nullable
- Includes `id` as auto-incrementing primary key
- Includes `timestamps` for created_at and updated_at fields
- Implements `down()` method for rolling back the migration

### Routes <a name="routes"></a>

The API routes are registered using Laravel's Route facade:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// API Routes
Route::apiResource('products', ProductController::class);
```

#### Route Details

The `apiResource()` method automatically creates the following routes:

| HTTP Method | URI                      | Action   | Route Name        |
|-------------|--------------------------|----------|-------------------|
| GET         | /api/products            | index    | products.index    |
| POST        | /api/products            | store    | products.store    |
| GET         | /api/products/{product}  | show     | products.show     |
| PUT/PATCH   | /api/products/{product}  | update   | products.update   |
| DELETE      | /api/products/{product}  | destroy  | products.destroy  |

---

## 7. Recommendations <a name="recommendations"></a>

Based on analysis of the current implementation, the following improvements are recommended:

### 1. Authentication & Authorization

- **Implementation:** Laravel Sanctum or Passport for API token authentication
- **Benefits:** 
  - Secure API access
  - User-specific actions and permissions
  - Protection against unauthorized access

### 2. Pagination

- **Implementation:** Add pagination to the index method
- **Example Code:**
  ```php
  return response()->json([
      'message' => 'Products retrieved successfully!',
      'title' => 'Success',
      'data' => Product::paginate(15)
  ], 200);
  ```
- **Benefits:**
  - Improved performance for large datasets
  - Reduced bandwidth usage
  - Better client-side rendering

### 3. Advanced Filtering & Sorting

- **Implementation:** Add query parameters for filtering and sorting
- **Example Parameters:**
  - `/api/products?sort=price&order=desc`
  - `/api/products?min_price=10&max_price=100`
  - `/api/products?search=keyword`
- **Benefits:**
  - More flexible data retrieval
  - Better user experience
  - Reduced data transfer

### 4. API Versioning

- **Implementation:** Add API versioning in URL structure
- **Example:** `/api/v1/products`
- **Benefits:**
  - Backward compatibility
  - Easy migration path for clients
  - Support for multiple API versions simultaneously

### 5. Resource Transformers

- **Implementation:** Use Laravel's API Resources
- **Benefits:**
  - Consistent response formatting
  - Easier to add/remove fields
  - Data transformation in one place

### 6. Comprehensive Logging

- **Implementation:** Add detailed logging for API requests and responses
- **Benefits:**
  - Better debugging capabilities
  - Audit trail
  - Performance monitoring

### 7. Rate Limiting

- **Implementation:** Add Laravel's built-in rate limiting middleware
- **Benefits:**
  - Protection against abuse
  - Fair resource allocation
  - Prevents DoS attacks

### 8. API Documentation with OpenAPI/Swagger

- **Implementation:** Use tools like L5-Swagger
- **Benefits:**
  - Interactive documentation
  - Client code generation
  - Easier testing

### 9. Data Validation Expansion

- **Implementation:** Add more comprehensive validation rules
- **Benefits:**
  - Better data integrity
  - More informative error messages
  - Protection against edge cases

### 10. Soft Deletes

- **Implementation:** Add Laravel's SoftDeletes trait to the Product model
- **Benefits:**
  - Recovery of accidentally deleted products
  - Data history
  - Better data integrity
