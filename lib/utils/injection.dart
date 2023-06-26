import 'package:get_it/get_it.dart';
import 'package:test_again/provider/contact/contact.dart';

final locator = GetIt.instance;

void init() {
  // Provider
  locator.registerLazySingleton<ContactProvider>(() => ContactProvider());
}
