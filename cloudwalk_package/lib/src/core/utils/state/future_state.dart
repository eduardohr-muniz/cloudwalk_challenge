import 'package:cloudwalk_package/src/core/utils/state/overlay_loader.dart';
import 'package:flutter/material.dart';

class FutureState<T> extends StatelessWidget {
  final bool ignoreListEmpty;
  final Future<T> future;
  final T? initialData;
  final Widget Function(BuildContext context, Object? error)? onError;
  final Widget Function(BuildContext context)? onLoading;
  final Widget Function(BuildContext context, T data) onComplete;
  final Function(BuildContext context)? onEmpty;
  const FutureState({
    required this.future,
    required this.onComplete,
    super.key,
    this.initialData,
    this.onError,
    this.onLoading,
    this.onEmpty,
    this.ignoreListEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (context, snapshot) {
        final status = snapshot.connectionState;

        if (snapshot.hasError) {
          if (onLoading == null) Loader.hide();
          if (onError != null) {
            return onError!(context, snapshot.error);
          }
        }

        if (status == ConnectionState.waiting) {
          if (onLoading != null) {
            return onLoading!(context);
          } else {
            Loader.show(context, overlayColor: Colors.transparent);
          }
        }

        if (status == ConnectionState.done) {
          if (onLoading == null) Loader.hide();
          if (snapshot.hasData && snapshot.data.toString() != "[]") {
            return onComplete(context, snapshot.data as T);
          }
          if (!snapshot.hasData && ignoreListEmpty) {
            return onComplete(context, snapshot.data as T);
          }
          if (onEmpty != null) {
            return onEmpty!(context);
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
