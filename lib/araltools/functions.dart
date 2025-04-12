// Copyright (C) 2025 Tudlang
//
// This file is part of AralTools.
//
// AralTools is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// AralTools is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with AralTools.  If not, see <https://www.gnu.org/licenses/>.

import 'package:araltools/araltools/araltools.dart';
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
                },
              ),
              FilledButton(
                onPressed: () {
                  GoRouter.of(context)
                    ..pop()
                    ..go('/');
                },
                child: Text(strings.general.general.ok),
              )
            ],
          );
        },
      ),
    );

/// Shows the "create new project" dialog
Future showNewProjectDialog(BuildContext context, AralTools araltool) =>
    onPlatform(
      all: Future.value(),
      windows: showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return ContentDialog(
            title: Text(strings.general.functions.newProject.title),
            content: Text(strings.general.functions.newProject.desc),
            actions: [
              Button(
                child: Text(strings.general.general.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FilledButton(
                onPressed: () {
                  GoRouter.of(context)
                    ..pop()
                    ..pushReplacement(araltool.route);
                },
                child: Text(strings.general.general.ok),
              ),
            ],
          );
        },
      ),
    );
