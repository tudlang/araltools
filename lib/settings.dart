
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

const kEmptyIcon = IconData(0x0020);


final Map<SettingCategory, List<SettingTile>> settings = {
  SettingCategory(id: 'general', icon: Icons.monitor): [
    //SettingTile<String>(
    //  id: 'mode',
    //  key: 'settingsGeneralMode',
    //  defaultval: 'system',
    //  options: ['system', 'light', 'dark'],
    //  isVisible: false,
    //),
    SettingTile<String>(
      id: 'language',
      key: 'settingsGeneralLanguage',
      isVisible: false,
      defaultval: 'en',
    )
  ],
};


dynamic getSettings(
  String categoryId,
  String tileId,
) =>
    settings.entries
        .singleWhere((element) => element.key.id == categoryId)
        .value
        .singleWhere((element) => element.id == tileId)
        .getValue();

Future<bool> setSettings(String categoryId, String tileId, dynamic value) =>
    settings.entries
        .singleWhere((element) => element.key.id == categoryId)
        .value
        .singleWhere((element) => element.id == tileId)
        .setValue(value);

class SettingCategory {
  final String id;
  final IconData icon;
  final void Function() onTap;
  final bool isVisible;

  const SettingCategory({
    required this.id,
    this.icon = kEmptyIcon,
    this.onTap = _,
    this.isVisible = true,
  });
}

class SettingTile<T> {
  final String id;
  final String key;
  final T defaultval;
  final IconData icon;
  final void Function(BuildContext context)? onTap;
  final List<T>? options;
  final bool isVisible;
  final bool isAdvanced;
  final String? subtitle;
  final bool showIndicator;
  final String? prerequisiteIdCategory;
  final String? prerequisiteIdTile;

  /// Called before a value gets changed.
  ///
  /// Return `true` if the new [value] will be saved. <br/>
  /// Return `false` to retain the current `getValue()` value.
  final Future<bool> Function(dynamic value) onChanged;

  ///
  final Future<dynamic> Function(dynamic value)? modifyValue;

  static Future<bool> _onChanged(_) async => true;

  const SettingTile({
    required this.id,
    required this.key,
    required this.defaultval,
    this.icon = kEmptyIcon,
    this.subtitle,
    this.onTap,
    this.onChanged = _onChanged,
    this.options,
    this.isVisible = true,
    this.isAdvanced = false,
    this.showIndicator = true,
    this.prerequisiteIdCategory,
    this.prerequisiteIdTile,
    this.modifyValue,
  });

  dynamic getValue() {
    var value = () {
      switch (defaultval.runtimeType) {
        case String:
          return prefs.getString(key);
        case const (List<String>):
          return prefs.getStringList(key);
        case bool:
          return prefs.getBool(key);
        case double:
          return prefs.getDouble(key);
        case int:
          return prefs.getInt(key);
        default:
          return null;
      }
    }();

    print('GET $key  ${value.runtimeType} : $value');

    return value ?? defaultval;
  }

  Future<bool> setValue(T? value) async {
    final prefs = await SharedPreferences.getInstance();
    bool output = false;

    if (value == null)
      output = await prefs.remove(key);
    else if (value is String)
      output = await prefs.setString(key, value);
    else if (value is List<String>)
      output = await prefs.setStringList(key, value);
    else if (value is bool)
      output = await prefs.setBool(key, value);
    else if (value is double)
      output = await prefs.setDouble(key, value);
    else if (value is int) output = await prefs.setInt(key, value);
    print('SET $key ${value.runtimeType} TO $value');

    return output;
  }

  bool get isEnabled =>
      (prerequisiteIdCategory == null && prerequisiteIdTile == null)
          ? true
          : getSettings(prerequisiteIdCategory!, prerequisiteIdTile!);
}

void _() {}
