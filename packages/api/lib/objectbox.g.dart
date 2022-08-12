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

import 'models/local/tree/local_tree.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7075317631028539711),
      name: 'LocalTree',
      lastPropertyId: const IdUid(8, 7271446348558300706),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 596397980775022984),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3646741077717461391),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1842123839618611812),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6237972075130416868),
            name: 'address2',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5701425493392377207),
            name: 'species',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 318114451228785340),
            name: 'height',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 9093165262021395799),
            name: 'circumference',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7271446348558300706),
            name: 'readlId',
            type: 6,
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
      lastEntityId: const IdUid(1, 7075317631028539711),
      lastIndexId: const IdUid(0, 0),
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
    LocalTree: EntityDefinition<LocalTree>(
        model: _entities[0],
        toOneRelations: (LocalTree object) => [],
        toManyRelations: (LocalTree object) => {},
        getId: (LocalTree object) => object.id,
        setId: (LocalTree object, int id) {
          object.id = id;
        },
        objectToFB: (LocalTree object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          final address2Offset = object.address2 == null
              ? null
              : fbb.writeString(object.address2!);
          final speciesOffset =
              object.species == null ? null : fbb.writeString(object.species!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, address2Offset);
          fbb.addOffset(4, speciesOffset);
          fbb.addInt64(5, object.height);
          fbb.addInt64(6, object.circumference);
          fbb.addInt64(7, object.readlId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalTree()
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..address = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..address2 = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 10)
            ..species = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 12)
            ..height =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14)
            ..circumference =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16)
            ..readlId = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 18);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LocalTree] entity fields to define ObjectBox queries.
class LocalTree_ {
  /// see [LocalTree.id]
  static final id = QueryIntegerProperty<LocalTree>(_entities[0].properties[0]);

  /// see [LocalTree.name]
  static final name =
      QueryStringProperty<LocalTree>(_entities[0].properties[1]);

  /// see [LocalTree.address]
  static final address =
      QueryStringProperty<LocalTree>(_entities[0].properties[2]);

  /// see [LocalTree.address2]
  static final address2 =
      QueryStringProperty<LocalTree>(_entities[0].properties[3]);

  /// see [LocalTree.species]
  static final species =
      QueryStringProperty<LocalTree>(_entities[0].properties[4]);

  /// see [LocalTree.height]
  static final height =
      QueryIntegerProperty<LocalTree>(_entities[0].properties[5]);

  /// see [LocalTree.circumference]
  static final circumference =
      QueryIntegerProperty<LocalTree>(_entities[0].properties[6]);

  /// see [LocalTree.readlId]
  static final readlId =
      QueryIntegerProperty<LocalTree>(_entities[0].properties[7]);
}
