import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'database.g.dart';
class OfficeUser extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 6, max: 32)();

  TextColumn get content => text().named('body')();

  IntColumn get category =>
      integer().nullable().references(OfficeUserCategory, #id)();

  DateTimeColumn get createdAt => dateTime().nullable()();
}

class OfficeUserCategory extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get description => text()();
}
@DriftDatabase(tables: [OfficeUser, OfficeUserCategory])
class AppDatabase extends _$AppDatabase {
  AppDatabase():super(_openConnection());

  @override

  int get schemaVersion =>1;

}
QueryExecutor _openConnection() {
return driftDatabase(name: 'my_database');
}
