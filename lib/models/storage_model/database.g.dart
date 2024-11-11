// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $OfficeUserCategoryTable extends OfficeUserCategory
    with TableInfo<$OfficeUserCategoryTable, OfficeUserCategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficeUserCategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'office_user_category';
  @override
  VerificationContext validateIntegrity(
      Insertable<OfficeUserCategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfficeUserCategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfficeUserCategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $OfficeUserCategoryTable createAlias(String alias) {
    return $OfficeUserCategoryTable(attachedDatabase, alias);
  }
}

class OfficeUserCategoryData extends DataClass
    implements Insertable<OfficeUserCategoryData> {
  final int id;
  final String description;
  const OfficeUserCategoryData({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  OfficeUserCategoryCompanion toCompanion(bool nullToAbsent) {
    return OfficeUserCategoryCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory OfficeUserCategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfficeUserCategoryData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  OfficeUserCategoryData copyWith({int? id, String? description}) =>
      OfficeUserCategoryData(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  OfficeUserCategoryData copyWithCompanion(OfficeUserCategoryCompanion data) {
    return OfficeUserCategoryData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfficeUserCategoryData(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfficeUserCategoryData &&
          other.id == this.id &&
          other.description == this.description);
}

class OfficeUserCategoryCompanion
    extends UpdateCompanion<OfficeUserCategoryData> {
  final Value<int> id;
  final Value<String> description;
  const OfficeUserCategoryCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  OfficeUserCategoryCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<OfficeUserCategoryData> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  OfficeUserCategoryCompanion copyWith(
      {Value<int>? id, Value<String>? description}) {
    return OfficeUserCategoryCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficeUserCategoryCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $OfficeUserTable extends OfficeUser
    with TableInfo<$OfficeUserTable, OfficeUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficeUserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES office_user_category (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, category, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'office_user';
  @override
  VerificationContext validateIntegrity(Insertable<OfficeUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfficeUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfficeUserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $OfficeUserTable createAlias(String alias) {
    return $OfficeUserTable(attachedDatabase, alias);
  }
}

class OfficeUserData extends DataClass implements Insertable<OfficeUserData> {
  final int id;
  final String title;
  final String content;
  final int? category;
  final DateTime? createdAt;
  const OfficeUserData(
      {required this.id,
      required this.title,
      required this.content,
      this.category,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  OfficeUserCompanion toCompanion(bool nullToAbsent) {
    return OfficeUserCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory OfficeUserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfficeUserData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<int?>(json['category']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<int?>(category),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  OfficeUserData copyWith(
          {int? id,
          String? title,
          String? content,
          Value<int?> category = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      OfficeUserData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category.present ? category.value : this.category,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  OfficeUserData copyWithCompanion(OfficeUserCompanion data) {
    return OfficeUserData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfficeUserData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfficeUserData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.createdAt == this.createdAt);
}

class OfficeUserCompanion extends UpdateCompanion<OfficeUserData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int?> category;
  final Value<DateTime?> createdAt;
  const OfficeUserCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OfficeUserCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<OfficeUserData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? category,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OfficeUserCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<int?>? category,
      Value<DateTime?>? createdAt}) {
    return OfficeUserCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficeUserCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $OfficeUserCategoryTable officeUserCategory =
      $OfficeUserCategoryTable(this);
  late final $OfficeUserTable officeUser = $OfficeUserTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [officeUserCategory, officeUser];
}

typedef $$OfficeUserCategoryTableCreateCompanionBuilder
    = OfficeUserCategoryCompanion Function({
  Value<int> id,
  required String description,
});
typedef $$OfficeUserCategoryTableUpdateCompanionBuilder
    = OfficeUserCategoryCompanion Function({
  Value<int> id,
  Value<String> description,
});

final class $$OfficeUserCategoryTableReferences extends BaseReferences<
    _$AppDatabase, $OfficeUserCategoryTable, OfficeUserCategoryData> {
  $$OfficeUserCategoryTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OfficeUserTable, List<OfficeUserData>>
      _officeUserRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.officeUser,
              aliasName: $_aliasNameGenerator(
                  db.officeUserCategory.id, db.officeUser.category));

  $$OfficeUserTableProcessedTableManager get officeUserRefs {
    final manager = $$OfficeUserTableTableManager($_db, $_db.officeUser)
        .filter((f) => f.category.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_officeUserRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OfficeUserCategoryTableFilterComposer
    extends Composer<_$AppDatabase, $OfficeUserCategoryTable> {
  $$OfficeUserCategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  Expression<bool> officeUserRefs(
      Expression<bool> Function($$OfficeUserTableFilterComposer f) f) {
    final $$OfficeUserTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.officeUser,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfficeUserTableFilterComposer(
              $db: $db,
              $table: $db.officeUser,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OfficeUserCategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $OfficeUserCategoryTable> {
  $$OfficeUserCategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$OfficeUserCategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfficeUserCategoryTable> {
  $$OfficeUserCategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  Expression<T> officeUserRefs<T extends Object>(
      Expression<T> Function($$OfficeUserTableAnnotationComposer a) f) {
    final $$OfficeUserTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.officeUser,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfficeUserTableAnnotationComposer(
              $db: $db,
              $table: $db.officeUser,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OfficeUserCategoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfficeUserCategoryTable,
    OfficeUserCategoryData,
    $$OfficeUserCategoryTableFilterComposer,
    $$OfficeUserCategoryTableOrderingComposer,
    $$OfficeUserCategoryTableAnnotationComposer,
    $$OfficeUserCategoryTableCreateCompanionBuilder,
    $$OfficeUserCategoryTableUpdateCompanionBuilder,
    (OfficeUserCategoryData, $$OfficeUserCategoryTableReferences),
    OfficeUserCategoryData,
    PrefetchHooks Function({bool officeUserRefs})> {
  $$OfficeUserCategoryTableTableManager(
      _$AppDatabase db, $OfficeUserCategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfficeUserCategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfficeUserCategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfficeUserCategoryTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              OfficeUserCategoryCompanion(
            id: id,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
          }) =>
              OfficeUserCategoryCompanion.insert(
            id: id,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OfficeUserCategoryTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({officeUserRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (officeUserRefs) db.officeUser],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (officeUserRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$OfficeUserCategoryTableReferences
                            ._officeUserRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OfficeUserCategoryTableReferences(db, table, p0)
                                .officeUserRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.category == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OfficeUserCategoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OfficeUserCategoryTable,
    OfficeUserCategoryData,
    $$OfficeUserCategoryTableFilterComposer,
    $$OfficeUserCategoryTableOrderingComposer,
    $$OfficeUserCategoryTableAnnotationComposer,
    $$OfficeUserCategoryTableCreateCompanionBuilder,
    $$OfficeUserCategoryTableUpdateCompanionBuilder,
    (OfficeUserCategoryData, $$OfficeUserCategoryTableReferences),
    OfficeUserCategoryData,
    PrefetchHooks Function({bool officeUserRefs})>;
typedef $$OfficeUserTableCreateCompanionBuilder = OfficeUserCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<int?> category,
  Value<DateTime?> createdAt,
});
typedef $$OfficeUserTableUpdateCompanionBuilder = OfficeUserCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<int?> category,
  Value<DateTime?> createdAt,
});

final class $$OfficeUserTableReferences
    extends BaseReferences<_$AppDatabase, $OfficeUserTable, OfficeUserData> {
  $$OfficeUserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OfficeUserCategoryTable _categoryTable(_$AppDatabase db) =>
      db.officeUserCategory.createAlias($_aliasNameGenerator(
          db.officeUser.category, db.officeUserCategory.id));

  $$OfficeUserCategoryTableProcessedTableManager? get category {
    if ($_item.category == null) return null;
    final manager =
        $$OfficeUserCategoryTableTableManager($_db, $_db.officeUserCategory)
            .filter((f) => f.id($_item.category!));
    final item = $_typedResult.readTableOrNull(_categoryTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OfficeUserTableFilterComposer
    extends Composer<_$AppDatabase, $OfficeUserTable> {
  $$OfficeUserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$OfficeUserCategoryTableFilterComposer get category {
    final $$OfficeUserCategoryTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.officeUserCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfficeUserCategoryTableFilterComposer(
              $db: $db,
              $table: $db.officeUserCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OfficeUserTableOrderingComposer
    extends Composer<_$AppDatabase, $OfficeUserTable> {
  $$OfficeUserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$OfficeUserCategoryTableOrderingComposer get category {
    final $$OfficeUserCategoryTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $db.officeUserCategory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfficeUserCategoryTableOrderingComposer(
              $db: $db,
              $table: $db.officeUserCategory,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OfficeUserTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfficeUserTable> {
  $$OfficeUserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$OfficeUserCategoryTableAnnotationComposer get category {
    final $$OfficeUserCategoryTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.category,
            referencedTable: $db.officeUserCategory,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$OfficeUserCategoryTableAnnotationComposer(
                  $db: $db,
                  $table: $db.officeUserCategory,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OfficeUserTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfficeUserTable,
    OfficeUserData,
    $$OfficeUserTableFilterComposer,
    $$OfficeUserTableOrderingComposer,
    $$OfficeUserTableAnnotationComposer,
    $$OfficeUserTableCreateCompanionBuilder,
    $$OfficeUserTableUpdateCompanionBuilder,
    (OfficeUserData, $$OfficeUserTableReferences),
    OfficeUserData,
    PrefetchHooks Function({bool category})> {
  $$OfficeUserTableTableManager(_$AppDatabase db, $OfficeUserTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfficeUserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfficeUserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfficeUserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              OfficeUserCompanion(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            Value<int?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              OfficeUserCompanion.insert(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OfficeUserTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({category = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (category) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.category,
                    referencedTable:
                        $$OfficeUserTableReferences._categoryTable(db),
                    referencedColumn:
                        $$OfficeUserTableReferences._categoryTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$OfficeUserTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OfficeUserTable,
    OfficeUserData,
    $$OfficeUserTableFilterComposer,
    $$OfficeUserTableOrderingComposer,
    $$OfficeUserTableAnnotationComposer,
    $$OfficeUserTableCreateCompanionBuilder,
    $$OfficeUserTableUpdateCompanionBuilder,
    (OfficeUserData, $$OfficeUserTableReferences),
    OfficeUserData,
    PrefetchHooks Function({bool category})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$OfficeUserCategoryTableTableManager get officeUserCategory =>
      $$OfficeUserCategoryTableTableManager(_db, _db.officeUserCategory);
  $$OfficeUserTableTableManager get officeUser =>
      $$OfficeUserTableTableManager(_db, _db.officeUser);
}
