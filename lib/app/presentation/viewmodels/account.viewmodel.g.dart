// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountViewModel on _AccountViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_AccountViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$loginAtom = Atom(name: '_AccountViewModelBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_AccountViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_AccountViewModelBaseActionController =
      ActionController(name: '_AccountViewModelBase');

  @override
  dynamic _setLoading(bool value) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction();
    try {
      return super._setLoading(value);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLogin(String value) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction();
    try {
      return super.setLogin(value);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},login: ${login.toString()},password: ${password.toString()}';
    return '{$string}';
  }
}
