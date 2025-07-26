part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoading extends ProductState {}
final class ProductSuccess extends ProductState {
  final ProductModel productModel;

  ProductSuccess({required this.productModel});
}
final class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});
}