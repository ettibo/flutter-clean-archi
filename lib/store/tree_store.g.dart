// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on TreeStoreBase, Store {
  late final _$treesAtom = Atom(name: 'TreeStoreBase.trees', context: context);

  @override
  ObservableList<Tree> get trees {
    _$treesAtom.reportRead();
    return super.trees;
  }

  @override
  set trees(ObservableList<Tree> value) {
    _$treesAtom.reportWrite(value, super.trees, () {
      super.trees = value;
    });
  }

  @override
  String toString() {
    return '''
trees: ${trees}
    ''';
  }
}
