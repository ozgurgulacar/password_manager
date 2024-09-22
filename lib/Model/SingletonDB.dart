import '../Database/Database.dart';

class SingletonDB {

  static  AppDatabase? _database;

  SingletonDB._(){
    _getDB();
  }// Private constructor

  static AppDatabase? getInstance() {
    if(_database==null){
      SingletonDB._();
    }
    return _database;
  }



  void _getDB() async {
    _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }


}