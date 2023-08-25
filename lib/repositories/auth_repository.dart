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
    print('로그인');
    throw UnimplementedError();
  }

  /// 로그아웃
  Future<void> signOut() {
    print('로그아웃');
    throw UnimplementedError(); 
  }
}

/// 계정 Repository Mock
class FakeAuthRepository implements AuthRepository {
  
  /// 로그인
  @override
  Future<String> signIn(String id) async{
    print('테스트 로그인');
    return id;
  }

  /// 로그아웃
  @override
  Future<void> signOut() async{
    print('테스트 로그아웃');
  }

}
