import 'package:flutter_architecture/app/data/repositories/auth.repository.dart';
import 'package:flutter_architecture/app/data/sources/network/auth.service.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Controllers

  //Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepository());

  //Services
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
}