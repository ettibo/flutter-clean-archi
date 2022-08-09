import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/use_case/tree/tree_list.dart';
import 'package:mobx/mobx.dart';

part 'tree_list_view_model.g.dart';

class TreeListViewModel = TreeListViewModelBase with _$TreeListViewModel;

abstract class TreeListViewModelBase with Store {
  final GetTreeList useCase = DependecyInjection.instance.get<GetTreeList>();
  @observable
  ObservableList<Tree> trees = ObservableList();

  void process() async {
    List<Tree> newTrees = await useCase.fetch(startRow: 0, nbRows: 50);
    trees.addAll(newTrees);
  }
}
