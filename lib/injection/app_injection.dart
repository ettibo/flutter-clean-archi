import 'package:globo_fitness/injection/data_source_injection.dart';
import 'package:globo_fitness/injection/storage_injection.dart';
import 'package:globo_fitness/injection/use_case_injection.dart';
import 'package:globo_fitness/injection/view_model_injection.dart';
import 'package:globo_fitness/injection/store_injection.dart';

Future<void> setupInjectionDependencies() async {
  await registerStorage();
  registerDataSources();
  registerUseCases();
  registerStores();
  registerViewModels();
}
