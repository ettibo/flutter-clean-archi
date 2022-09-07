// import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/local_tree_data_source.dart';
import 'package:api/data_source/tree/remote_tree_data_source.dart';
import 'package:data/data_source/tree/local_tree_data_source_impl.dart';
import 'package:data/data_source/tree/local_tree_web_data_source_impl.dart';
import 'package:data/data_source/tree/remote_tree_data_source_impl.dart';
import 'package:api/dependency_injection.dart';
import 'package:flutter/foundation.dart';

void registerDataSources() {
  DependecyInjection.instance
      .inject<RemoteTreeDataSource>(RemoteTreeDataSourceImpl());
  if (!kIsWeb) {
    DependecyInjection.instance
        .inject<LocalTreeDataSource>(LocalTreeDataSourceImpl());
  } else {
    DependecyInjection.instance
        .inject<LocalTreeDataSource>(LocalTreeWebDataSourceImpl());
  }
}
