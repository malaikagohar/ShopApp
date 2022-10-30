import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/configurations.dart';
import 'package:shop_app/providers/product.dart';

import '../models/http_exception.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];
  final String? authToken;
  final String? userId;
  List<Product> _favorites = [];

  Products(this.authToken, this.userId, this._items);
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return [..._favorites];
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  Future<void> addProduct(Product product, String category) async {
    final url = Uri.parse(
        'https://shopapp-f5733-default-rtdb.firebaseio.com//products/$category.json?auth=$authToken');
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': false
          }));
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          category: product.category);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((product) => product.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://shopapp-f5733-default-rtdb.firebaseio.com/products/%id.json?auth=$authToken');
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {}
  }

  Future<void> fetchAndSetProducts(String category, bool showFavorites) async {
    List<String> catList = categories.keys.map((e) => e).toList();
    _favorites.clear();

    if (showFavorites) {
      try {
        for (int i = 0; i < catList.length; i++) {
          var url = Uri.parse(
              'https://shopapp-f5733-default-rtdb.firebaseio.com/products/${catList[i].toLowerCase()}.json?auth=$authToken');

          final response = await http.get(url);
          final extractedData = json.decode(response.body);

          if (extractedData == null) {
            return;
          }

          url = Uri.parse(
              'https://shopapp-f5733-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken');
          final favoriteResponse = await http.get(url);

          final favoriteData = json.decode(favoriteResponse.body);

          extractedData.forEach((prodId, prodData) {
            ;
            if (favoriteData[prodId] == true) {
              _favorites.add(Product(
                  id: prodId,
                  title: prodData['title'],
                  description: prodData['description'],
                  price: prodData['price'],
                  isFavorite: true,
                  imageUrl: prodData['imageUrl'],
                  category: category));
              notifyListeners();
            }
          });
        }
      } catch (error) {
        print(error);
      }
    } else {
      var url = Uri.parse(
          'https://shopapp-f5733-default-rtdb.firebaseio.com/products/$category.json?auth=$authToken');

      try {
        final response = await http.get(url);

        final extractedData = json.decode(response.body);

        if (extractedData == null) {
          return;
        }
        url = Uri.parse(
            'https://shopapp-f5733-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken');
        final favoriteResponse = await http.get(url);
        final favoriteData = json.decode(favoriteResponse.body);
        final List<Product> loadedProducts = [];
        extractedData.forEach((prodId, prodData) {
          loadedProducts.add(Product(
              id: prodId,
              title: prodData['title'],
              description: prodData['description'],
              price: prodData['price'],
              isFavorite:
                  favoriteData == null ? false : favoriteData[prodId] ?? false,
              imageUrl: prodData['imageUrl'],
              category: category));
          notifyListeners();
        });

        _items = loadedProducts;
        notifyListeners();
      } catch (error) {
        throw error;
      }
    }
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://shopapp-f5733-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
    final existingProductIndex =
        _items.indexWhere((product) => product.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Unable to delete');
    }
    existingProduct = null!;
  }
}
