// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'core/local_storage/entities/app_user_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3717963250085474326),
      name: 'AppUserEntity',
      lastPropertyId: const IdUid(18, 6573412102067689913),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7645681541879279366),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 595787963488381418),
            name: 'appUserId',
            type: 9,
            flags: 2048,
            indexId: const IdUid(1, 7656925614553981487)),
        ModelProperty(
            id: const IdUid(3, 3758282649347494992),
            name: 'fullName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6676262266468308378),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2447669088290843873),
            name: 'mobileNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8066626800004261274),
            name: 'grade',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2871733990845995572),
            name: 'gender',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8106155181526398788),
            name: 'country',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2784865966489940202),
            name: 'dateOfBirth',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 7223361669329576780),
            name: 'referralCode',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 1445535545480957480),
            name: 'role',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 3918587477480591979),
            name: 'governorate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 4326589202494955189),
            name: 'avatarUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 273796558880942011),
            name: 'accessToken',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 8044255094879510125),
            name: 'refreshToken',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 6138658003751903583),
            name: 'isPremium',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 4122114817341546328),
            name: 'isEmailVerified',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 6573412102067689913),
            name: 'isMobileVerified',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 3717963250085474326),
      lastIndexId: const IdUid(1, 7656925614553981487),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    AppUserEntity: EntityDefinition<AppUserEntity>(
        model: _entities[0],
        toOneRelations: (AppUserEntity object) => [],
        toManyRelations: (AppUserEntity object) => {},
        getId: (AppUserEntity object) => object.id,
        setId: (AppUserEntity object, int id) {
          object.id = id;
        },
        objectToFB: (AppUserEntity object, fb.Builder fbb) {
          final appUserIdOffset = fbb.writeString(object.appUserId);
          final fullNameOffset = fbb.writeString(object.fullName);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final mobileNumberOffset = object.mobileNumber == null
              ? null
              : fbb.writeString(object.mobileNumber!);
          final gradeOffset =
              object.grade == null ? null : fbb.writeString(object.grade!);
          final genderOffset =
              object.gender == null ? null : fbb.writeString(object.gender!);
          final countryOffset =
              object.country == null ? null : fbb.writeString(object.country!);
          final dateOfBirthOffset = object.dateOfBirth == null
              ? null
              : fbb.writeString(object.dateOfBirth!);
          final referralCodeOffset = fbb.writeString(object.referralCode);
          final roleOffset = fbb.writeString(object.role);
          final governorateOffset = object.governorate == null
              ? null
              : fbb.writeString(object.governorate!);
          final avatarUrlOffset = fbb.writeString(object.avatarUrl);
          final accessTokenOffset = object.accessToken == null
              ? null
              : fbb.writeString(object.accessToken!);
          final refreshTokenOffset = object.refreshToken == null
              ? null
              : fbb.writeString(object.refreshToken!);
          fbb.startTable(19);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, appUserIdOffset);
          fbb.addOffset(2, fullNameOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, mobileNumberOffset);
          fbb.addOffset(5, gradeOffset);
          fbb.addOffset(6, genderOffset);
          fbb.addOffset(7, countryOffset);
          fbb.addOffset(8, dateOfBirthOffset);
          fbb.addOffset(9, referralCodeOffset);
          fbb.addOffset(10, roleOffset);
          fbb.addOffset(11, governorateOffset);
          fbb.addOffset(12, avatarUrlOffset);
          fbb.addOffset(13, accessTokenOffset);
          fbb.addOffset(14, refreshTokenOffset);
          fbb.addBool(15, object.isPremium);
          fbb.addBool(16, object.isEmailVerified);
          fbb.addBool(17, object.isMobileVerified);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = AppUserEntity(
              appUserId: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              isEmailVerified: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 36, false),
              isMobileVerified: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 38, false),
              fullName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              mobileNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              grade: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              country: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              dateOfBirth: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              governorate: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26),
              gender: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 16),
              referralCode: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 22, ''),
              role: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 24, ''),
              avatarUrl: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 28, ''),
              accessToken: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 30),
              refreshToken: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 32),
              isPremium: const fb.BoolReader().vTableGet(buffer, rootOffset, 34, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [AppUserEntity] entity fields to define ObjectBox queries.
class AppUserEntity_ {
  /// see [AppUserEntity.id]
  static final id =
      QueryIntegerProperty<AppUserEntity>(_entities[0].properties[0]);

  /// see [AppUserEntity.appUserId]
  static final appUserId =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[1]);

  /// see [AppUserEntity.fullName]
  static final fullName =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[2]);

  /// see [AppUserEntity.email]
  static final email =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[3]);

  /// see [AppUserEntity.mobileNumber]
  static final mobileNumber =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[4]);

  /// see [AppUserEntity.grade]
  static final grade =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[5]);

  /// see [AppUserEntity.gender]
  static final gender =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[6]);

  /// see [AppUserEntity.country]
  static final country =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[7]);

  /// see [AppUserEntity.dateOfBirth]
  static final dateOfBirth =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[8]);

  /// see [AppUserEntity.referralCode]
  static final referralCode =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[9]);

  /// see [AppUserEntity.role]
  static final role =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[10]);

  /// see [AppUserEntity.governorate]
  static final governorate =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[11]);

  /// see [AppUserEntity.avatarUrl]
  static final avatarUrl =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[12]);

  /// see [AppUserEntity.accessToken]
  static final accessToken =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[13]);

  /// see [AppUserEntity.refreshToken]
  static final refreshToken =
      QueryStringProperty<AppUserEntity>(_entities[0].properties[14]);

  /// see [AppUserEntity.isPremium]
  static final isPremium =
      QueryBooleanProperty<AppUserEntity>(_entities[0].properties[15]);

  /// see [AppUserEntity.isEmailVerified]
  static final isEmailVerified =
      QueryBooleanProperty<AppUserEntity>(_entities[0].properties[16]);

  /// see [AppUserEntity.isMobileVerified]
  static final isMobileVerified =
      QueryBooleanProperty<AppUserEntity>(_entities[0].properties[17]);
}