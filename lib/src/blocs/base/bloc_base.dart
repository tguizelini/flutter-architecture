import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BlocBase extends ChangeNotifier {
  final _loading = BehaviorSubject<bool>.seeded(false);
  
  Observable<bool> get loading => _loading.stream.asBroadcastStream();
  void setLoading(bool status) => _loading.sink.add(status);

  @override
  void dispose() {
    _loading.close();
    
    super.dispose();
  }
}
