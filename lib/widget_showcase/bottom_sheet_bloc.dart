import 'package:rxdart/rxdart.dart';

class _Bloc {

  Stream<int> get selectedWidgetIndexStream => _selectedWidgetIndexStreamController.stream;
  final _selectedWidgetIndexStreamController = BehaviorSubject<int>();

  void updateIndex(int newIndex) {
    _selectedWidgetIndexStreamController.sink.add(newIndex);
  }

  void dispose() {
    _selectedWidgetIndexStreamController.close();
  }

}

final bloc = _Bloc();