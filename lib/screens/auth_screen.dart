import 'package:fittrix/providers/providers.dart';
import 'package:fittrix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var status = ref.watch(authNotifierProvider).status;
    return status == AuthState.unauthorized ? const LoginScreen() : const LogoutScreen();
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<LoginScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "아이디를 입력해주세요.",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isEmpty) {
                      customShowSnackbar(context: context, message: '아이디를 입력해주세요.');
                      return;
                    }
                    ref.read(authNotifierProvider.notifier).signIn(textEditingController.text);
                  },
                  child: const Text('로그인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutScreen extends ConsumerWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('아이디:${ref.watch(authNotifierProvider).data.toString()}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).signOut();
                },
                child: const Text('로그아웃'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
