import 'package:get_it/get_it.dart';
import 'package:test_again/provider/something/something.dart';

final locator = GetIt.instance;

void init() {
  //Database
  // locator.registerLazySingleton<BookDatabase>(() => BookDatabase());

  // Provider
  locator.registerLazySingleton<SomethingProvider>(() => SomethingProvider());

  //External
}