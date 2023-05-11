// Copyright (C) 2023 Tudlang
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
// along with AralTools.  If not, see <http://www.gnu.org/licenses/>.

import 'package:araltools/main.dart';
import 'package:araltools/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              strings.general.home.welcome,
              style: textTheme.headlineLarge,
            ),
          ),
          Divider(),
          Wrap(
            children: [
              for (final araltool in AralTools.values)
                Container(
                  constraints: BoxConstraints(maxWidth: 450, minWidth: 450),
                  padding: EdgeInsets.all(8),
                  child: Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(araltool.icon),
                              SizedBox(width: 8),
                              Text(araltool.localizedName, style: textTheme.headlineSmall),
                            ],
                          ),
                          Text(araltool.localizedDesc),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).go(araltool.route, extra: {
                                'title': araltool.localizedName,
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(strings.general.general.go),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
