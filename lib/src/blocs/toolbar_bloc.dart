import 'package:rxdart/rxdart.dart';

import 'base/bloc_base.dart';

class ToolbarBloc extends BlocBase {
  final _toolbarElevaton = BehaviorSubject<int>.seeded(0);

  Observable<int> get toolbarElevation => _toolbarElevaton.stream.asBroadcastStream();
  void setToolbarElevation(int value) => _toolbarElevaton.sink.add(value);

  @override
  void dispose() {
    _toolbarElevaton.close();
    
    super.dispose();
  }
}
