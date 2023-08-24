import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomErrorWidget extends ConsumerWidget {
  const CustomErrorWidget({
    super.key,
    this.errorText,
    required this.onPressed,
  });

  final String? errorText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorText ?? '일시적인 오류가 발생했습니다.\n잠시 후 다시 시도해 주세요.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: onPressed,
            ),
          )
        ],
      ),
    );
  }
}
