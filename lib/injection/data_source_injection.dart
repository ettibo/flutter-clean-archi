import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:data/data_source/tree/remote_tree_data_source_impl.dart';
import 'package:api/dependency_injection.dart';

void registerDataSources() {
  DependecyInjection.instance
      .inject<RemoteTreeDataSource>(RemoteTreeDataSourceImpl());
}
