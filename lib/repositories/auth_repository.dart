import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 계정 Repository Provider
final authRepositoryProvider = Provider(
  (ref) => AuthRepository(),
  name: 'authRepositoryProvider'
);

/// 계정 Repository
class AuthRepository {
  
  /// 로그인
  Future<String> signIn(String id) {
    throw UnimplementedError();
  }

  /// 로그아웃
  Future<void> signOut() {
    throw UnimplementedError(); 
  }
}

/// 계정 Repository Mock
class FakeAuthRepository implements AuthRepository {
  @override
  Future<String> signIn(String id) async{
    print('로그인');
    return id;
  }

  @override
  Future<void> signOut() async{
    print('로그아웃');
  }

}
