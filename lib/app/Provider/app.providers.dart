import 'package:kids/Core/Notifiers/theme_notifier.dart';
import 'package:kids/app/Provider/auth.provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../Provider/state_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => Auth()),
    ChangeNotifierProvider(create: (_) => HandleState()),
  ];
}
