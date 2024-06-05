import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volleyball/database/app_database.dart';
import 'package:volleyball/ui/pages/game_zone.dart';
import 'package:volleyball/utils/team_provider.dart';
import 'package:volleyball/ui/pages/home_screen.dart';
import 'package:volleyball/utils/score_provider.dart';

void main() {
  final database = AppDatabase();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TeamProvider(database)),
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const GameZone(),
        routes: {
          '/homescreen': (context) => const GameZone(),
        },
      ),
    );
  }
}