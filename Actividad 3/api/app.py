from flask import Flask, jsonify, request
from pymongo import MongoClient
from bson.objectid import ObjectId

app = Flask(__name__)

# MongoDB connection
client = MongoClient('mongodb://localhost:27017/')
db = client['products']
collection = db['product']

# Create a product
@app.route('/add-products', methods=['POST'])
def create_product():
    data = request.json
    if not all(key in data for key in ('product_id', 'product_name', 'category', 'cost', 'on_hand')):
        return jsonify({'error': 'Missing fields'}), 400
    product = {
        'product_id': data['product_id'],
        'product_name': data['product_name'],
        'category': data['category'],
        'cost': data['cost'],
        'on_hand': data['on_hand']
    }
    result = collection.insert_one(product)
    return jsonify({'message': 'Product created', 'id': str(result.inserted_id)}), 201

# Read all products
@app.route('/products', methods=['GET'])
def get_all_products():
    products = []
    for product in collection.find():
        products.append({
            'id': str(product['_id']),
            'product_id': product['product_id'],
            'product_name': product['product_name'],
            'category': product['category'],
            'cost': product['cost'],
            'on_hand': product['on_hand']
        })
    return jsonify(products), 200

# Read a single product by id
@app.route('/products/<product_id>', methods=['GET'])
def get_product(product_id):
    product = collection.find_one({'product_id': int(product_id)})
    if not product:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify({
        'id': str(product['_id']),
        'product_id': product['product_id'],
        'product_name': product['product_name'],
        'category': product['category'],
        'cost': product['cost'],
        'on_hand': product['on_hand']
    }), 200

# Update a product by id
@app.route('/update-product/<product_id>', methods=['PUT'])
def update_product(product_id):
    data = request.json
    update_data = {key: data[key] for key in ('product_name', 'category', 'cost', 'on_hand') if key in data}
    if not update_data:
        return jsonify({'error': 'No fields to update'}), 400
    result = collection.update_one({'product_id': int(product_id)}, {'$set': update_data})
    if result.matched_count == 0:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify({'message': 'Product updated'}), 200

# Delete a product by id
@app.route('/delete-product/<product_id>', methods=['DELETE'])
def delete_product(product_id):
    result = collection.delete_one({'product_id': int(product_id)})
    if result.deleted_count == 0:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify({'message': 'Product deleted'}), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=4000)