import 'package:flutter_architecture/src/data/repositories/auth.repository.dart';
import 'package:flutter_architecture/src/data/sources/network/auth.service.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

void setupLocator() {
  //Controllers

  //Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepository());

  //Services
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
}