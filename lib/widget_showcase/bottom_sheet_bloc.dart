import 'package:rxdart/rxdart.dart';

class Bloc {

  Stream<int> get selectedWidgetIndexStream => _selectedWidgetIndexStreamController.stream;
  final _selectedWidgetIndexStreamController = PublishSubject<int>();

  void updateIndex(int newIndex) {
    print('in bloc $newIndex');
    _selectedWidgetIndexStreamController.sink.add(newIndex);
  }

  void dispose() {
    _selectedWidgetIndexStreamController.close();
  }

}

final bloc = Bloc();