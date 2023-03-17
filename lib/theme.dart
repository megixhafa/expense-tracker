import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: Colors.teal[500],
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context,listen: false).toggleTheme(value);
      },
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get  isDarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black38,
    colorScheme: ColorScheme.dark().copyWith(secondary: Colors.white54),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black38,
    colorScheme: ColorScheme.dark().copyWith(secondary: Colors.white54),
  );
}

