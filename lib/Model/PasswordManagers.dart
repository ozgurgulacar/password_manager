import 'package:floor/floor.dart';

@entity
class PasswordManagers {

  final String name;
  final String password;

  @primaryKey
  final int id;

  PasswordManagers(
      {required this.name, required this.password, required this.id});


}
