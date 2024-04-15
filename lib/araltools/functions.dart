import 'package:go_router/go_router.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '/strings.g.dart';
import '/utils.dart';


/// Shows the "go back home" dialog
Future showBackHomeDialog(BuildContext context) => onPlatform(
      all: Future.value(), //empty
      windows: showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return ContentDialog(
            title: Text(strings.general.functions.backToHome.title),
            content: Text(strings.general.functions.backToHome.desc),
            actions: [
              Button(
                  child: Text(strings.general.general.cancel),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  GoRouter.of(context).go('/');
                },
                child: Text(strings.general.general.ok),
              )
            ],
          );
        },
      ),
    );
