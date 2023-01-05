import 'package:kids/Core/Notifiers/theme_notifier.dart';
import 'package:kids/Core/Notifiers/auth.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => AuthNotifier()),
  ];
}
