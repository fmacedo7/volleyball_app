// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TeamsTable extends Teams with TableInfo<$TeamsTable, Team> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _numberOfPlayersMeta =
      const VerificationMeta('numberOfPlayers');
  @override
  late final GeneratedColumn<int> numberOfPlayers = GeneratedColumn<int>(
      'number_of_players', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, numberOfPlayers];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teams';
  @override
  VerificationContext validateIntegrity(Insertable<Team> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number_of_players')) {
      context.handle(
          _numberOfPlayersMeta,
          numberOfPlayers.isAcceptableOrUnknown(
              data['number_of_players']!, _numberOfPlayersMeta));
    } else if (isInserting) {
      context.missing(_numberOfPlayersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Team map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Team(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      numberOfPlayers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_players'])!,
    );
  }

  @override
  $TeamsTable createAlias(String alias) {
    return $TeamsTable(attachedDatabase, alias);
  }
}

class Team extends DataClass implements Insertable<Team> {
  final int id;
  final String name;
  final int numberOfPlayers;
  const Team(
      {required this.id, required this.name, required this.numberOfPlayers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['number_of_players'] = Variable<int>(numberOfPlayers);
    return map;
  }

  TeamsCompanion toCompanion(bool nullToAbsent) {
    return TeamsCompanion(
      id: Value(id),
      name: Value(name),
      numberOfPlayers: Value(numberOfPlayers),
    );
  }

  factory Team.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Team(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      numberOfPlayers: serializer.fromJson<int>(json['numberOfPlayers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'numberOfPlayers': serializer.toJson<int>(numberOfPlayers),
    };
  }

  Team copyWith({int? id, String? name, int? numberOfPlayers}) => Team(
        id: id ?? this.id,
        name: name ?? this.name,
        numberOfPlayers: numberOfPlayers ?? this.numberOfPlayers,
      );
  @override
  String toString() {
    return (StringBuffer('Team(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfPlayers: $numberOfPlayers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, numberOfPlayers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Team &&
          other.id == this.id &&
          other.name == this.name &&
          other.numberOfPlayers == this.numberOfPlayers);
}

class TeamsCompanion extends UpdateCompanion<Team> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> numberOfPlayers;
  const TeamsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.numberOfPlayers = const Value.absent(),
  });
  TeamsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int numberOfPlayers,
  })  : name = Value(name),
        numberOfPlayers = Value(numberOfPlayers);
  static Insertable<Team> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? numberOfPlayers,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (numberOfPlayers != null) 'number_of_players': numberOfPlayers,
    });
  }

  TeamsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? numberOfPlayers}) {
    return TeamsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      numberOfPlayers: numberOfPlayers ?? this.numberOfPlayers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (numberOfPlayers.present) {
      map['number_of_players'] = Variable<int>(numberOfPlayers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('numberOfPlayers: $numberOfPlayers')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $TeamsTable teams = $TeamsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [teams];
}

typedef $$TeamsTableInsertCompanionBuilder = TeamsCompanion Function({
  Value<int> id,
  required String name,
  required int numberOfPlayers,
});
typedef $$TeamsTableUpdateCompanionBuilder = TeamsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> numberOfPlayers,
});

class $$TeamsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TeamsTable,
    Team,
    $$TeamsTableFilterComposer,
    $$TeamsTableOrderingComposer,
    $$TeamsTableProcessedTableManager,
    $$TeamsTableInsertCompanionBuilder,
    $$TeamsTableUpdateCompanionBuilder> {
  $$TeamsTableTableManager(_$AppDatabase db, $TeamsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TeamsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TeamsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$TeamsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> numberOfPlayers = const Value.absent(),
          }) =>
              TeamsCompanion(
            id: id,
            name: name,
            numberOfPlayers: numberOfPlayers,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int numberOfPlayers,
          }) =>
              TeamsCompanion.insert(
            id: id,
            name: name,
            numberOfPlayers: numberOfPlayers,
          ),
        ));
}

class $$TeamsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TeamsTable,
    Team,
    $$TeamsTableFilterComposer,
    $$TeamsTableOrderingComposer,
    $$TeamsTableProcessedTableManager,
    $$TeamsTableInsertCompanionBuilder,
    $$TeamsTableUpdateCompanionBuilder> {
  $$TeamsTableProcessedTableManager(super.$state);
}

class $$TeamsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TeamsTable> {
  $$TeamsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get numberOfPlayers => $state.composableBuilder(
      column: $state.table.numberOfPlayers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TeamsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TeamsTable> {
  $$TeamsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get numberOfPlayers => $state.composableBuilder(
      column: $state.table.numberOfPlayers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$TeamsTableTableManager get teams =>
      $$TeamsTableTableManager(_db, _db.teams);
}
