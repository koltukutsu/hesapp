part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  AuthLoading();

  @override
  List<Object?> get props => [];
}

class AuthNotSignedIn extends AuthState {
  AuthNotSignedIn();

  @override
  List<Object?> get props => [];
}

class AuthSignInSuccessful extends AuthState {
  AuthSignInSuccessful([this.hesapUser]);

  final HesapUser? hesapUser;

  @override
  List<Object?> get props => [hesapUser];
}

class AuthSignUpSuccessful extends AuthState {
  AuthSignUpSuccessful();

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  AuthError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
