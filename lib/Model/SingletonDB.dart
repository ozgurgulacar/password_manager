import '../Database/Database.dart';

class SingletonDB {

  static SingletonDB? _instance;
  static AppDatabase? _database;

  SingletonDB._(){
    _getDB();
  }// Private constructor

  static AppDatabase? getInstance() {
    _instance ??= SingletonDB._();
    return _database;
  }



  void _getDB() async {
    await $FloorAppDatabase.databaseBuilder('app_database.db').build().then((value) {
    _database=value;
    return _database!;
    },);
  }


}