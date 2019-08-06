import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BlocBase extends ChangeNotifier {
  final _loading = BehaviorSubject<bool>.seeded(false);
  
  Observable<bool> get loading => _loading.stream.asBroadcastStream();
  void setLoading(bool status) => _loading.sink.add(status);

  String convertDateTime(String value){
    String ano = value.substring(0,4);
    String mes = value.substring(5,7);
    String dia = value.substring(8,10);
    String retornoData = "$dia/$mes/$ano";
    return retornoData;
  }

  String convertTimeOfDay(String value){    
    String hora =value.substring(11,15);
    return hora;
  }

  @override
  void dispose() {
    _loading.close();
    
    super.dispose();
  }
}
