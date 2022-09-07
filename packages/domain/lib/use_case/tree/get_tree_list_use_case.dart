import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/strategy/fetch_strategy.dart';
import 'package:api/use_case/tree/tree_list.dart';

class GetTreeListUseCase implements GetTreeList {
  RemoteTreeDataSource remoteTreeDataSource =
      DependecyInjection.instance.get<RemoteTreeDataSource>();
  LocalTreeDataSource localTreeDataSource =
      DependecyInjection.instance.get<LocalTreeDataSource>();

  @override
  Future<List<Tree>> fetch(
      {int startRow = 0,
      int nbRows = 20,
      FetchStrategy fetchStrategy = FetchStrategy.remote}) async {
    switch (fetchStrategy) {
      case FetchStrategy.remote:
        List<Tree> glTrees = await remoteTreeDataSource.getTreeListRemote(
            startRow: startRow, nbRows: nbRows);
        localTreeDataSource.saveTreeList(glTrees);
        return glTrees;
      case FetchStrategy.local:
        return localTreeDataSource.getTreeList();
    }
  }
}
