import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/models/domain/tree/tree_domain.dart';
import 'package:api/models/remote/tree/tree_list_response.dart';
import 'package:dio/dio.dart';

class RemoteTreeDataSourceImpl implements RemoteTreeDataSource {
  RemoteTreeDataSourceImpl();
  final Dio dio = Dio();
  @override
  Future<List<Tree>> getTreeListRemote(
      {int startRow = 0, int nbRows = 20}) async {
    List<Tree> glTrees = await dio
        .get(
      'https://opendata.paris.fr/api/records/1.0/search/?dataset=les-arbres&q=&rows=$nbRows&start=$startRow&facet=&facet=arrondissement&facet=libellefrancais&facet=genre&facet=espece&facet=circonferenceencm&facet=hauteurenm',
    )
        .then((response) {
      Map<String, dynamic> data = response.data;
      TreeListResponse result = TreeListResponse.fromJson(data);
      return result.toDomain();
    }).catchError((error) => throw error);
    return glTrees;
  }
}
