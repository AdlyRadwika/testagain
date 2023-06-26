import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_again/data/model/contact/contact.dart';
import 'package:test_again/utils/constants.dart';
import 'package:test_again/utils/provider_enum.dart';
import 'package:flutter/widgets.dart';

late ProviderState _state;

String _message = '';

List<Contact>? _contacts;

late Contact _detail;

class ContactProvider extends ChangeNotifier {
  ContactProvider() {
    fetchContacts();
  }

  ProviderState get state => _state;

  String get message => _message;

  List<Contact>? get contacts => _contacts;

  Contact get detail => _detail;

  Future<List<Contact>> fetchRawData() async {
    final String response = await rootBundle.loadString(Constants.dummyData);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File jsonFile = File("${appDocDir.path}/data.json");
    jsonFile.writeAsStringSync(response);
    final jsonData = jsonDecode(response);
    List<Contact> data =
        (jsonData as List).map((item) => Contact.fromJson(item)).toList();
    return data;
  }

  Future<void> fetchContacts() async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      final contacts = await fetchRawData();
      if (contacts.isEmpty || contacts == []) {
        _state = ProviderState.empty;
        _message = 'contacts are empty';
      } else {
        _state = ProviderState.loaded;
        _contacts = contacts;
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

  Future<void> updateContact(Contact data) async {
    _state = ProviderState.loading;
    notifyListeners();
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File jsonFile = File("${appDocDir.path}/data.json");
      jsonFile.writeAsStringSync(jsonEncode(data.toJson()));
      fetchContacts();
      notifyListeners();
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      _message = e.toString();
      _state = ProviderState.error;
      notifyListeners();
    }
  }

  void getDetail(Contact data) {
    _detail = data;
    notifyListeners();
  }
}
