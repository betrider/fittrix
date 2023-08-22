import 'package:equatable/equatable.dart';
import 'package:fittrix/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthStates>(
  () {
    return AuthNotifier();
  },
  name: 'authProvider',
);

class AuthNotifier extends Notifier<AuthStates> {
  @override
  AuthStates build() {
    return const AuthStates(status: AuthState.unauthorized);
  }

  Future<void> login() async {
    try {
      // 로그인 로직을 구현합니다.
      state = AuthStates(previous: state.status, status: AuthState.authorized, data: null);
    } catch (e) {
      state = AuthStates(previous: state.status, status: AuthState.unauthorized, data: null);
    }
  }

  Future<void> logout() async {
    try {
      // 로그아웃 로직을 구현합니다.
      state = const AuthStates(status: AuthState.unauthorized, data: null);
    } catch (e) {
      state = const AuthStates(status: AuthState.unauthorized, data: null);
    }
  }
}

class AuthStates<T> extends Equatable {
  final AuthState? previous;
  final AuthState status;
  final T? data;
  final String? message;

  const AuthStates({
    this.previous,
    required this.status,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [previous, status, data, message];

  AuthStates copyWith({
    AuthState? previous,
    AuthState? status,
    T? data,
    String? message,
  }) {
    return AuthStates(
      previous: previous ?? this.previous,
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
