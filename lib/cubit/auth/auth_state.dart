part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  const AuthLoading();

  @override
  List<Object?> get props => [];
}

class AuthNotSignedIn extends AuthState {
  const AuthNotSignedIn();

  @override
  List<Object?> get props => [];
}

class AuthSignInSuccessful extends AuthState {
  const AuthSignInSuccessful([this.hesapUser]);

  final HesapUser? hesapUser;

  @override
  List<Object?> get props => [hesapUser];
}

class AuthSignUpSuccessful extends AuthState {
  const AuthSignUpSuccessful();

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  const AuthError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
