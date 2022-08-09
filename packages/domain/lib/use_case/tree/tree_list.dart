import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/use_case/tree/tree_list.dart';

class GetTreeLiseUseCase implements GetTreeList {
  RemoteTreeDataSource remoteTreeDataSource =
      DependecyInjection.instance.get<RemoteTreeDataSource>();
  // Constructor
  GetTreeLiseUseCase();
  @override
  Future<List<Tree>> fetch({int startRow = 0, int nbRows = 20}) async {
    List<Tree> glTrees = await remoteTreeDataSource.getTreeListRemote(
        startRow: startRow, nbRows: nbRows);
    return glTrees;
  }
}
