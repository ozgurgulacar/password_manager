import 'package:floor/floor.dart';

import '../Model/PasswordManagers.dart';
import '../Model/User.dart';

@dao
abstract class DatabaseDao {

  //User Tablosu
  @Query('SELECT * FROM User')
  Future<List<User?>> getUser();

  @insert
  Future<void> insertUser(User user);

  @update
  Future<void> updateUser(User user);


  //PasswordManager Tablosu
  @Query('SELECT * FROM PasswordManagers')
  Future<List<PasswordManagers?>> getAllPassword();

  @Query('SELECT * FROM PasswordManagers WHERE name = :name')
  Stream<PasswordManagers?> findPassword(String name);

  @insert
  Future<void> insertPassword(PasswordManagers password);

  @update
  Future<void> updatePassword(PasswordManagers password);

  @delete
  Future<void> deletePassword(PasswordManagers password);

}