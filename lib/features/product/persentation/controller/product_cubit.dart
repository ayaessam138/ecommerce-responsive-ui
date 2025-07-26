import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/dependency_injection.dart';
import '../../data/models/product_model.dart';
import '../../data/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  static ProductCubit get get => getIt();
  static ProductCubit of(BuildContext context) => context.read<ProductCubit>();

  Future getProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getUserProduct();
    result.fold(
      (fail) {
        emit(ProductFailure(errorMessage: fail.apiErrorModel.message ?? ''));
      },
      (success) {
        emit(ProductSuccess(productModel: success));
      },
    );
  }
}
