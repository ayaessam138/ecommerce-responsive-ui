
import 'package:client/features/login/data/model/login_model.dart';
import 'package:client/features/login/data/repo/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/dependency_injection.dart';
import '../../data/param/login_param.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;


  static LoginCubit get get => getIt();
  static LoginCubit of(BuildContext context) => context.read<LoginCubit>();

  Future login({
    required LoginParam params,
  }) async {

    emit( LoginLoading());
    final result = await loginRepo.login(
      params: params,
    );
    result.fold((fail){
      emit(LoginFailure(errorMessage: fail.apiErrorModel.message??''));
    }, (success){
      emit(LoginSuccess(loginModel: success));
    });
  }
}
