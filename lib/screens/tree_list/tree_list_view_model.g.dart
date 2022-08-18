// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeListViewModel on TreeListViewModelBase, Store {
  late final _$isLoadingTreesAtom =
      Atom(name: 'TreeListViewModelBase.isLoadingTrees', context: context);

  @override
  bool get isLoadingTrees {
    _$isLoadingTreesAtom.reportRead();
    return super.isLoadingTrees;
  }

  @override
  set isLoadingTrees(bool value) {
    _$isLoadingTreesAtom.reportWrite(value, super.isLoadingTrees, () {
      super.isLoadingTrees = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('TreeListViewModelBase.fetch', context: context);

  @override
  Future<void> fetch({int startRow = 0, dynamic nbRows = 20}) {
    return _$fetchAsyncAction
        .run(() => super.fetch(startRow: startRow, nbRows: nbRows));
  }

  late final _$onListRefreshAsyncAction =
      AsyncAction('TreeListViewModelBase.onListRefresh', context: context);

  @override
  Future<void> onListRefresh() {
    return _$onListRefreshAsyncAction.run(() => super.onListRefresh());
  }

  @override
  String toString() {
    return '''
isLoadingTrees: ${isLoadingTrees}
    ''';
  }
}
