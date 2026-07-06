import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'services/notes_helper.dart';
import 'theme/theme.dart';
import 'theme/theme_manager.dart';
import 'widgets/debug_floating_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesHelperDatabase.init(); 

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([appThemeMode, appLocale]),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appThemeMode.value,
          locale: appLocale.value,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ur'), // Urdu
            Locale('ar'), // Arabic
          ],
          builder: (context, widget) {
            return DebugFloatingButton(child: widget!);
          },
          home: const HomeScreen(),
        );
      },
    );
  }
}