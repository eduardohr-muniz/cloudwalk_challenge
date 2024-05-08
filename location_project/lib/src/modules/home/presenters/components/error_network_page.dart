import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

class ErrorDefaultPage extends StatelessWidget {
  final void Function() onTryAgain;
  const ErrorDefaultPage({
    super.key,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Sz.ii.paddingAll,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ops, ocorreu um erro temporário.",
                style: context.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Sz.i.sizedBoxH,
              Text(
                "Tente ativar sua localização, e clicar no botão abaixo",
                style: context.textTheme.bodyMedium?.muted(context),
                textAlign: TextAlign.center,
              ),
              Sz.ii.sizedBoxH,
              FilledButton(onPressed: onTryAgain, child: const Text('Tentar Novamente')),
            ],
          ),
        ),
      ),
    );
  }
}
