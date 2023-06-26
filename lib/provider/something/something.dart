import 'package:test_again/utils/provider_enum.dart';
import 'package:flutter/widgets.dart';

late ProviderState _state;

String _message = '';

// List<SomethingModel>? _Somethings;


class SomethingProvider extends ChangeNotifier {

  SomethingProvider() {
    fetchSomethings();
  }

  ProviderState get state => _state;

  String get message => _message;

  // List<SomethingModel>? get Somethings => _Somethings;

  Future<void> fetchSomethings() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      // final Somethings = await db.getSomethings();
      final Somethings = [];
      if (Somethings.isEmpty || Somethings == []) {
        _state = ProviderState.empty;
        _message = 'Somethings are empty';
      } else {
        _state = ProviderState.loaded;
        // _Somethings = Somethings;
      }
      notifyListeners();
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      _message = e.toString();
      _state = ProviderState.error;
      notifyListeners();
    }
  }


}