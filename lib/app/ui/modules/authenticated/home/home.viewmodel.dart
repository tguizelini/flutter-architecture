import 'package:flutter_architecture/core/base/view_model.base.dart';
import 'package:mobx/mobx.dart';

part 'home.viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends BaseViewModel with Store {
  
}