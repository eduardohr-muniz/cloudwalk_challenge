import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';
import 'package:location_project/src/modules/home/aplication/stores/home_store.dart';

class ErrorLimitRequestApiPage extends StatelessWidget {
  final IpapiLimitError error;
  final HomeStore store;
  const ErrorLimitRequestApiPage({
    super.key,
    required this.error,
    required this.store,
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
              Text(error.message.toString(), style: context.textTheme.headlineMedium),
              Text("Verifique se sua localização está habilitada.", style: context.textTheme.bodyMedium?.muted(context)),
              Sz.i.sizedBoxH,
              Text("Possivel problema:", style: context.textTheme.labelLarge),
              Sz.i.sizedBoxH,
              Text("Excedemos o limite de requisições da api por minuto.", style: context.textTheme.bodyMedium?.muted(context)),
              Sz.ii.sizedBoxH,
              FilledButton(
                  onPressed: () {
                    store.tryAgain();
                  },
                  child: const Text('Tentar Novamente')),
              if (store.serviceLocationEnable)
                FilledButton.tonal(
                    onPressed: () async {
                      await store.requestPermission();
                    },
                    child: const Text('Conceder permissões')),
            ],
          ),
        ),
      ),
    );
  }
}
