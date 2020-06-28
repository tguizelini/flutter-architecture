import 'package:flutter_architecture/app/data/auth.repository.dart';
import 'package:flutter_architecture/app/data/sources/remote/auth.service.dart';
import 'package:flutter_architecture/app/data/sources/remote/user.service.dart';
import 'package:flutter_architecture/app/ui/modules/unauthenticated/login/login.viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'http_client.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton<HttpClient>(new HttpClient());

  //Remote Services
  inject.registerLazySingleton<AuthService>(() => new AuthService());
  inject.registerLazySingleton<UserService>(() => new UserService());
  
  //Repositories
  inject.registerLazySingleton<AuthRepository>(() => new AuthRepository());

  //ViewModels
  inject.registerLazySingleton<LoginViewModel>(() => new LoginViewModel());
}