import 'package:api/models/app/tree/tree.dart';
import 'package:api/strategy/fetch_strategy.dart';

abstract class GetTreeList {
  Future<List<Tree>> fetch(
      {int startRow = 0,
      int nbRows = 20,
      FetchStrategy fetchStrategy = FetchStrategy.remote});
}
