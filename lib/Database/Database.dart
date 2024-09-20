import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../Model/PasswordManagers.dart';
import '../Model/User.dart';
import 'DatabaseDao.dart';

part 'database.g.dart';


@Database(version: 3, entities: [User,PasswordManagers])
abstract class AppDatabase extends FloorDatabase {
  DatabaseDao get dao;

}