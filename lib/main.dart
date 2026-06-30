import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/notes_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotesHelperDatabase.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen(title: "My Notes"));
  }
}
