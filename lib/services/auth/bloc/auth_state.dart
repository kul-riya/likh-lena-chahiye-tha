// ignore_for_file: use_super_parameters

import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:likh_lena_chahiye_tha/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({required this.isLoading, this.loadingText = 'Please wait'});
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering({required this.exception, required isLoading})
      : super(isLoading: isLoading);
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;

  const AuthStateForgotPassword(
      {required this.exception,
      required this.hasSentEmail,
      required super.isLoading});
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({required this.user, required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required bool isLoading,
    String? loadingText,
  }) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [exception, isLoading];
}
