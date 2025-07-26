import '../../../../core/helpers/app_const.dart';
import '../../../../core/network/dio_client.dart' show DioClient;
import '../models/product_model.dart';

abstract class ProductApi {
  Future<ProductModel> getProducts();
}

class ProductApiImpl implements ProductApi {
  final DioClient dioClient;

  ProductApiImpl({required this.dioClient});
  @override
  Future<ProductModel> getProducts() async {
    final response = await dioClient.get(ApiConstants.product);
    return ProductModel.fromJson(response.data);
  }
}
