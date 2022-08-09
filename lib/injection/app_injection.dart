import 'package:globo_fitness/injection/data_source_injection.dart';
import 'package:globo_fitness/injection/use_case_injection.dart';
import 'package:globo_fitness/injection/view_model_injection.dart';

void setupInjectionDependencies() {
  registerDataSources();
  registerUseCases();
  registerViewModels();
}
