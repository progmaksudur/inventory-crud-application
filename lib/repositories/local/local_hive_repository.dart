import 'package:hive/hive.dart';
import 'package:inventory_crud_application/domain/models/response_model/product_list_model.dart';

class LocalProductRepository {
  static const String _productBoxName = 'productListModel';

  Future<void> saveProducts(List<ProductListModel> products) async {
    final productBox = await _openBox();
    await productBox.put('productList', products);
  }

  Future<List<ProductListModel>> getProducts() async {
    final productBox = await _openBox();
    return productBox.get('productList')!;
  }


  Future<void> deleteProduct(String id) async {
    final productBox = await _openBox();
    await productBox.delete(id);
  }

  Future<Box<List<ProductListModel>>> _openBox() async {
    if (Hive.isBoxOpen(_productBoxName)) {
      return Hive.box<List<ProductListModel>>(_productBoxName);
    } else {
      return await Hive.openBox<List<ProductListModel>>(_productBoxName);
    }
  }
}
class ProductListAdapter extends TypeAdapter<ProductListModel> {
  @override
  final int typeId = 0;

  @override
  ProductListModel read(BinaryReader reader) {
    Map<String, dynamic> fields = Map<String, dynamic>.from(reader.readMap());
    return ProductListModel.fromJson(fields);
  }

  @override
  void write(BinaryWriter writer, ProductListModel obj) {
    writer.writeMap(obj.toJson());
  }
}

