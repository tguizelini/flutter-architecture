import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/data/sources/remote/auth.service.dart';
import 'package:flutter_architecture/app/data/sources/remote/user.service.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'http_client.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Components
  serviceLocator.registerSingleton<HttpClient>(new HttpClient());

  //Remote Services
  serviceLocator.registerLazySingleton<AuthService>(() => new AuthService());
  serviceLocator.registerLazySingleton<UserService>(() => new UserService());
  
  //Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(() => new AuthRepository());

  //ViewModels
  serviceLocator.registerLazySingleton<LoginViewModel>(() => new LoginViewModel());
}