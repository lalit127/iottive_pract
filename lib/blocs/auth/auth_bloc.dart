import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iottive_pract/utils/app_preference.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:iottive_pract/repositories/auth_repository.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<LoginRequest>(_onLogin);
  }

  Future<void> _onLogin(LoginRequest event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final user = await authRepository.login(event.email, event.password);
      await AppPreference().addStringToSF('access_token', user.authToken ?? '');
      await AppPreference().saveUser(user);
      emit(state.copyWith(isLoading: false, userModel: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
