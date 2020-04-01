import 'package:flutter_architecture/app/data/repositories/account.repository.dart';
import 'package:flutter_architecture/app/data/sources/network/auth.service.dart';
import 'package:flutter_architecture/app/data/sources/network/user.service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_architecture/app/presentation/viewmodels/account.viewmodel.dart';

import 'components/http_client.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  //Components
  serviceLocator.registerSingleton<HttpClient>(new HttpClient());

  //Remote Services
  serviceLocator.registerLazySingleton<AuthService>(() => new AuthService());
  serviceLocator.registerLazySingleton<UserService>(() => new UserService());
  
  //Repositories
  serviceLocator.registerLazySingleton<AccountRepository>(() => new AccountRepository());

  //ViewModels
  serviceLocator.registerLazySingleton<AccountViewModel>(() => new AccountViewModel());
}