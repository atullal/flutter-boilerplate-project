import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/product/product.dart';
import 'package:boilerplate/models/product/product_list.dart';
import 'package:sembast/sembast.dart';

class ProductDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _productsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Future<Database> _db;

  // Constructor
  ProductDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Product product) async {
    return await _productsStore.add(await _db, product.toMap());
  }

  Future<int> count() async {
    return await _productsStore.count(await _db);
  }

  Future<List<Product>> getAllSortedByFilter({List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _productsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Product> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final product = Product.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      product.id = snapshot.key.toString();
      return product;
    }).toList();
  }

  Future<ProductList> getProductsFromDb() async {
    print('Loading from database');

    // product list
    var productsList;

    // fetching data
    final recordSnapshots = await _productsStore.find(
      await _db,
    );

    // Making a List<Product> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      productsList = ProductList(
          products: recordSnapshots.map((snapshot) {
        final product = Product.fromMap(snapshot.value);
        // An ID is a key of a record from the database.
        product.id = snapshot.key.toString();
        return product;
      }).toList());
    }

    return productsList;
  }

  Future<int> update(Product product) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(product.id));
    return await _productsStore.update(
      await _db,
      product.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Product product) async {
    final finder = Finder(filter: Filter.byKey(product.id));
    return await _productsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _productsStore.drop(
      await _db,
    );
  }
}
