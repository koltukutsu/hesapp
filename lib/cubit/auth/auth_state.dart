part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  get hesapUser => null;
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  AuthLoading();

  @override
  List<Object?> get props => [];
}

class AuthAnonymous extends AuthState {
  AuthAnonymous();

  @override
  List<Object?> get props => [];
}

class AuthLoggedIn extends AuthState {
  AuthLoggedIn(this.hesapUser);

  final HesapUser? hesapUser;

  @override
  List<Object?> get props => [hesapUser];
}

class AuthSignedUp extends AuthState {
  AuthSignedUp();

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  AuthError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
