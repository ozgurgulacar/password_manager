// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'package:password_manager/Database/Database.dart';





abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DatabaseDao? _daoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER NOT NULL, `password` TEXT NOT NULL, `isActive` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PasswordManagers` (`name` TEXT NOT NULL, `password` TEXT NOT NULL, `id` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DatabaseDao get dao {
    return _daoInstance ??= _$DatabaseDao(database, changeListener);
  }
}

class _$DatabaseDao extends DatabaseDao {
  _$DatabaseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'isActive': item.isActive ? 1 : 0
                }),
        _passwordManagersInsertionAdapter = InsertionAdapter(
            database,
            'PasswordManagers',
            (PasswordManagers item) => <String, Object?>{
                  'name': item.name,
                  'password': item.password,
                  'id': item.id
                },
            changeListener),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'password': item.password,
                  'isActive': item.isActive ? 1 : 0
                }),
        _passwordManagersUpdateAdapter = UpdateAdapter(
            database,
            'PasswordManagers',
            ['id'],
            (PasswordManagers item) => <String, Object?>{
                  'name': item.name,
                  'password': item.password,
                  'id': item.id
                },
            changeListener),
        _passwordManagersDeletionAdapter = DeletionAdapter(
            database,
            'PasswordManagers',
            ['id'],
            (PasswordManagers item) => <String, Object?>{
                  'name': item.name,
                  'password': item.password,
                  'id': item.id
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final InsertionAdapter<PasswordManagers> _passwordManagersInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final UpdateAdapter<PasswordManagers> _passwordManagersUpdateAdapter;

  final DeletionAdapter<PasswordManagers> _passwordManagersDeletionAdapter;

  @override
  Future<List<User?>> getUser() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            password: row['password'] as String,
            isActive: (row['isActive'] as int) != 0));
  }

  @override
  Future<List<PasswordManagers?>> getAllPassword() async {
    return _queryAdapter.queryList('SELECT * FROM PasswordManagers',
        mapper: (Map<String, Object?> row) => PasswordManagers(
            name: row['name'] as String,
            password: row['password'] as String,
            id: row['id'] as int));
  }

  @override
  Stream<PasswordManagers?> findPassword(String name) {
    return _queryAdapter.queryStream(
        'SELECT * FROM PasswordManagers WHERE name = ?1',
        mapper: (Map<String, Object?> row) => PasswordManagers(
            name: row['name'] as String,
            password: row['password'] as String,
            id: row['id'] as int),
        arguments: [name],
        queryableName: 'PasswordManagers',
        isView: false);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPassword(PasswordManagers password) async {
    await _passwordManagersInsertionAdapter.insert(
        password, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePassword(PasswordManagers password) async {
    await _passwordManagersUpdateAdapter.update(
        password, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePassword(PasswordManagers password) async {
    await _passwordManagersDeletionAdapter.delete(password);
  }
}
