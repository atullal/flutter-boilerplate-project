// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ProductStore.loading'))
      .value;

  final _$fetchProductsFutureAtom =
      Atom(name: '_ProductStore.fetchProductsFuture');

  @override
  ObservableFuture<ProductList> get fetchProductsFuture {
    _$fetchProductsFutureAtom.reportRead();
    return super.fetchProductsFuture;
  }

  @override
  set fetchProductsFuture(ObservableFuture<ProductList> value) {
    _$fetchProductsFutureAtom.reportWrite(value, super.fetchProductsFuture, () {
      super.fetchProductsFuture = value;
    });
  }

  final _$productListAtom = Atom(name: '_ProductStore.productList');

  @override
  ProductList get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ProductList value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$successAtom = Atom(name: '_ProductStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$getProductsAsyncAction = AsyncAction('_ProductStore.getProducts');

  @override
  Future<dynamic> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  @override
  String toString() {
    return '''
fetchProductsFuture: ${fetchProductsFuture},
productList: ${productList},
success: ${success},
loading: ${loading}
    ''';
  }
}
