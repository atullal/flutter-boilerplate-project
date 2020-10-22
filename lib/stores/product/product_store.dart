import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/product/product_list.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ProductStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ProductList> emptyProductResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ProductList> fetchProductsFuture =
      ObservableFuture<ProductList>(emptyProductResponse);

  @observable
  ProductList productList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchProductsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getProducts() async {
    final future = _repository.getProducts();
    fetchProductsFuture = ObservableFuture(future);

    future.then((productList) {
      this.productList = productList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
