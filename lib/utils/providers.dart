import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_again/provider/something/something.dart';
import 'package:test_again/utils/injection.dart' as di;

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => di.locator<SomethingProvider>()),
];