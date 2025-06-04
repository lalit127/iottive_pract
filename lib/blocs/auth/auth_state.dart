import 'package:equatable/equatable.dart';
import 'package:iottive_pract/models/user_model.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final UserModel? userModel;
  final String? error;

  const AuthState({this.isLoading = false, this.userModel, this.error});

  AuthState copyWith({bool? isLoading, UserModel? userModel, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      userModel: userModel ?? this.userModel,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, userModel, error];
}
