import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error_handle/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../api/product_api.dart';
import '../models/product_model.dart';

class ProductRepo {
  final ProductApi productApi;
  final NetworkInfo networkInfo;

  ProductRepo({required this.productApi, required this.networkInfo});
  Future<Either<ErrorHandler, ProductModel>> getUserProduct() async {
    try {
      final response = await productApi.getProducts();

      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
