import 'package:cached_network_image/cached_network_image.dart';
import 'package:fittrix/providers/record_async_notifier_provider.dart';
import 'package:fittrix/repositories/record_repository.dart';
import 'package:fittrix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 운동 기록 하기 화면
class RecordScreen extends ConsumerStatefulWidget {
  const RecordScreen({
    Key? key,
    required this.fitnessType,
  }) : super(key: key);

  final FitnessType fitnessType;

  @override
  ConsumerState<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends ConsumerState<RecordScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('운동 기록 하기(${widget.fitnessType.toString()})'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: widget.fitnessType.imageUrl,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: "운동 기록을 입력해주세요.",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (textEditingController.text.isEmpty) {
                          customShowSnackbar(
                            context: context,
                            message: '운동 기록을 입력해주세요.',
                          );
                          return;
                        }

                        var isDone = await customShowDialogOKCancel(
                          context: context,
                          title: '등록',
                          content: '운동 기록을 등록하겠습니까?',
                        );

                        if (isDone) {
                          var record = Record(
                            fitnessType: widget.fitnessType,
                            createdAt: DateTime.now(),
                            content: textEditingController.text,
                          );

                          ref
                              .read(recordAsyncNotifierProvider.notifier)
                              .addRecord(record)
                              .then((value) {
                            customShowSnackbar(
                              context: context,
                              message: '운동 기록을 등록했습니다.',
                            );
                            context.pop();
                          });
                        }
                      },
                      child: const Text('등록하기'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
