import 'package:rxdart/rxdart.dart';

class BlocBase {
  final _loading = BehaviorSubject<bool>.seeded(false);
  
  Observable<bool> get loading => _loading.stream;
  void setLoading(bool status) => _loading.sink.add(status);

  void dispose() {
    _loading.close();
  }
}
