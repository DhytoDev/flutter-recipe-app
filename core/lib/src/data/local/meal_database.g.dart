// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class MealEntity extends DataClass implements Insertable<MealEntity> {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strMealThumb;

  MealEntity(
      {@required this.idMeal,
      @required this.strMeal,
      @required this.strCategory,
      @required this.strMealThumb});

  factory MealEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return MealEntity(
      idMeal:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}id_meal']),
      strMeal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal']),
      strCategory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category']),
      strMealThumb: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb']),
    );
  }

  factory MealEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return MealEntity(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
    );
  }

  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strCategory': serializer.toJson<String>(strCategory),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<MealEntity>>(bool nullToAbsent) {
    return MealsCompanion(
      idMeal:
          idMeal == null && nullToAbsent ? const Value.absent() : Value(idMeal),
      strMeal: strMeal == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeal),
      strCategory: strCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(strCategory),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
    ) as T;
  }

  MealEntity copyWith(
          {String idMeal,
          String strMeal,
          String strCategory,
          String strMealThumb}) =>
      MealEntity(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strCategory: strCategory ?? this.strCategory,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );

  @override
  String toString() {
    return (StringBuffer('MealEntity(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strCategory: $strCategory, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      $mrjc($mrjc($mrjc(0, idMeal.hashCode), strMeal.hashCode),
          strCategory.hashCode),
      strMealThumb.hashCode));

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is MealEntity &&
          other.idMeal == idMeal &&
          other.strMeal == strMeal &&
          other.strCategory == strCategory &&
          other.strMealThumb == strMealThumb);
}

class MealsCompanion extends UpdateCompanion<MealEntity> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strCategory;
  final Value<String> strMealThumb;

  const MealsCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strCategory = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  });
}

class $MealsTable extends Meals with TableInfo<$MealsTable, MealEntity> {
  final GeneratedDatabase _db;
  final String _alias;

  $MealsTable(this._db, [this._alias]);

  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  GeneratedTextColumn _idMeal;

  @override
  GeneratedTextColumn get idMeal => _idMeal ??= _constructIdMeal();

  GeneratedTextColumn _constructIdMeal() {
    return GeneratedTextColumn(
      'id_meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  GeneratedTextColumn _strMeal;

  @override
  GeneratedTextColumn get strMeal => _strMeal ??= _constructStrMeal();

  GeneratedTextColumn _constructStrMeal() {
    return GeneratedTextColumn(
      'str_meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  GeneratedTextColumn _strCategory;

  @override
  GeneratedTextColumn get strCategory =>
      _strCategory ??= _constructStrCategory();

  GeneratedTextColumn _constructStrCategory() {
    return GeneratedTextColumn(
      'str_category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  GeneratedTextColumn _strMealThumb;

  @override
  GeneratedTextColumn get strMealThumb =>
      _strMealThumb ??= _constructStrMealThumb();

  GeneratedTextColumn _constructStrMealThumb() {
    return GeneratedTextColumn(
      'str_meal_thumb',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [idMeal, strMeal, strCategory, strMealThumb];

  @override
  $MealsTable get asDslTable => this;

  @override
  String get $tableName => _alias ?? 'meals';
  @override
  final String actualTableName = 'meals';

  @override
  VerificationContext validateIntegrity(MealsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.idMeal.present) {
      context.handle(
          _idMealMeta, idMeal.isAcceptableValue(d.idMeal.value, _idMealMeta));
    } else if (idMeal.isRequired && isInserting) {
      context.missing(_idMealMeta);
    }
    if (d.strMeal.present) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableValue(d.strMeal.value, _strMealMeta));
    } else if (strMeal.isRequired && isInserting) {
      context.missing(_strMealMeta);
    }
    if (d.strCategory.present) {
      context.handle(_strCategoryMeta,
          strCategory.isAcceptableValue(d.strCategory.value, _strCategoryMeta));
    } else if (strCategory.isRequired && isInserting) {
      context.missing(_strCategoryMeta);
    }
    if (d.strMealThumb.present) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableValue(
              d.strMealThumb.value, _strMealThumbMeta));
    } else if (strMealThumb.isRequired && isInserting) {
      context.missing(_strMealThumbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};

  @override
  MealEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MealEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MealsCompanion d) {
    final map = <String, Variable>{};
    if (d.idMeal.present) {
      map['id_meal'] = Variable<String, StringType>(d.idMeal.value);
    }
    if (d.strMeal.present) {
      map['str_meal'] = Variable<String, StringType>(d.strMeal.value);
    }
    if (d.strCategory.present) {
      map['str_category'] = Variable<String, StringType>(d.strCategory.value);
    }
    if (d.strMealThumb.present) {
      map['str_meal_thumb'] =
          Variable<String, StringType>(d.strMealThumb.value);
    }
    return map;
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(_db, alias);
  }
}

abstract class _$MealDatabase extends GeneratedDatabase {
  _$MealDatabase(QueryExecutor e)
      : super(const SqlTypeSystem.withDefaults(), e);
  $MealsTable _meals;

  $MealsTable get meals => _meals ??= $MealsTable(this);
  MealDao _mealDao;

  MealDao get mealDao => _mealDao ??= MealDao(this as MealDatabase);

  @override
  List<TableInfo> get allTables => [meals];
}
