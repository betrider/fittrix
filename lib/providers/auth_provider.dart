import 'package:equatable/equatable.dart';
import 'package:fittrix/repositories/auth_repository.dart';
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

  Future<void> signIn(String id) async {
    try {
      var result = await ref.read(authRepositoryProvider).signIn(id);
      state = AuthStates(previous: state.status, status: AuthState.authorized, data: result);
    } catch (e) {
      state = AuthStates(previous: state.status, status: AuthState.unauthorized, data: null);
    }
  }

  Future<void> signOut() async {
    try {
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

  const AuthStates({
    this.previous,
    required this.status,
    this.data,
  });

  @override
  List<Object?> get props => [previous, status, data];

  AuthStates copyWith({
    AuthState? previous,
    AuthState? status,
    T? data,
  }) {
    return AuthStates(
      previous: previous ?? this.previous,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}
