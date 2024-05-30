import 'package:extensionresoft/extensionresoft.dart';

import 'constants.dart';

/// USER ID
String get userID => SharedPreferencesService.getString('userID') ?? Constants.empty;

set userID(String value) => SharedPreferencesService.setString('userID', value);

