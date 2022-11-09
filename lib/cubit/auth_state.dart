part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userData;
  AuthSuccess(this.userData);

  @override
  List<Object> get props => [userData];
}

class AuthFailed extends AuthState {
  final String errorMessage;
  AuthFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
