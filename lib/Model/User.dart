import 'package:floor/floor.dart';

@entity
class User{
  @primaryKey
  final int? id;

  final String password;
  final bool isActive;

  User({this.id, required this.password, required this.isActive});
}