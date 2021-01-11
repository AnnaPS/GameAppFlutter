import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_app/di/injector.dart';
import 'package:game_app/presentation/pages/home_page.dart';
import 'package:game_app/presentation/providers/game_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.I<GameProvider>()
            ..getGames('switch')
            ..getGames('playstation5')
            ..getGames('topsales')
            ..getGames('xboxseriesx'),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
