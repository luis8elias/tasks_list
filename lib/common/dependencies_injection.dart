import 'package:injector/injector.dart';

import '/data/repositories_impl/task_api_repository.dart';
import '/domain/repositories/i_task_repository.dart';

void injectDependencies(){
  Injector.appInstance.registerSingleton<ITaskRepository>(
    () => TaskApiRepository()
  );
}
