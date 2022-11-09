import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/core/i_repository.dart';
import 'package:appointment/infrastructure/client/converter.dart';
import 'package:appointment/infrastructure/client/dao.dart';
import 'package:appointment/infrastructure/client/repository.dart';
import 'package:appointment/infrastructure/core/dao.dart';
import 'package:appointment/infrastructure/core/entity_model_converter.dart';
import 'package:appointment/infrastructure/drift/db.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@injectableInit
void servicesConfiguration() {
  getIt.registerSingleton<Dao<ClientModel>>(ClientDao(getIt<DriftDb>()));

  getIt.registerSingleton<EntityModelConverter<Client, ClientModel>>(
      ClientConveter());

  getIt.registerSingleton<IRepository<Client>>(ClientRepository(
      getIt<Dao<ClientModel>>(),
      getIt<EntityModelConverter<Client, ClientModel>>()));

  $initGetIt(getIt);
}
