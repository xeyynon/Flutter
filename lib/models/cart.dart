import 'package:flutter/foundation.dart';
import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // ✅ Initialize _catalog properly
  CatalogModel _catalog = CatalogModel(); // Initialize with an empty catalog

  // Collection of item IDs in the cart
  final List<int> _itemIds = [];

  // ✅ Corrected getter for catalog
  CatalogModel get catalog => _catalog;

  // ✅ Corrected setter for catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // ✅ Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // ✅ Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // ✅ Add item to cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // ✅ Remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
