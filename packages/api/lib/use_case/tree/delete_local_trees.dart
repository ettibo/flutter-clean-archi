import 'package:api/strategy/fetch_strategy.dart';

abstract class DeleteLocalTrees {
  Future<void> deleteTrees({required FetchStrategy fetchStrategy});
}
