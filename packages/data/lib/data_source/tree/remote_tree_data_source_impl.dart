import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:data/models/domain/tree/tree_domain.dart';
import 'package:data/models/remote/tree/tree_list_response.dart';
import 'package:dio/dio.dart';

class RemoteTreeDataSourceImpl implements RemoteTreeDataSource {
  RemoteTreeDataSourceImpl();
  final Dio dio = Dio();
  @override
  Future<List<Tree>> getTreeListRemote(
      {int startRow = 0, int nbRows = 20}) async {
    List<Tree> glTrees = await dio
        .get(
      'https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&q=&rows=$nbRows&start=$startRow',
    )
        .then((response) {
      Map<String, dynamic> data = response.data;
      TreeListResponse result = TreeListResponse.fromJson(data);
      return result.toDomain();
    }).catchError((error) => throw error);
    return glTrees;
  }
}
