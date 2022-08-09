import 'package:api/dependency_injection.dart';
import 'package:api/models/app/tree/tree.dart';
import 'package:api/use_case/tree/tree_list.dart';
import 'package:globo_fitness/template/view_model/view_model.dart';
import 'package:mobx/mobx.dart';

part 'tree_list_view_model.g.dart';

class TreeListViewModel = TreeListViewModelBase with _$TreeListViewModel;

abstract class TreeListViewModelBase with Store, ViewModel {
  final GetTreeList useCase = DependecyInjection.instance.get<GetTreeList>();
  @observable
  ObservableList<Tree> trees = ObservableList();

  @override
  void init() {
    fetch();
  }

  @override
  void dispose() {}

  void fetch() async {
    List<Tree> newTrees = await useCase.fetch(startRow: 0, nbRows: 50);
    trees.addAll(newTrees);
  }
}
