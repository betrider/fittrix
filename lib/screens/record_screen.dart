import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittrix/utils/enums.dart';
import 'package:flutter/material.dart';

/// 운동 기록 하기 화면
class RecordScreen extends StatelessWidget {
  const RecordScreen({
    Key? key,
    required this.fitnessType,
  }) : super(key: key);

  final FitnessType fitnessType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('운동 기록 하기(${fitnessType.toString()})'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(imageUrl: fitnessType.imageUrl),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
