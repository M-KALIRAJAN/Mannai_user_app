import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


import 'package:mannai_user_app/routing/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  Initialize Hive
   await  Hive.initFlutter();
  // open the hive container
   await Hive.openBox("aboutBox");
   await Hive.openBox("blockbox");
  runApp(
   ProviderScope(
    child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      routerConfig: appRouter,
    );
  }
}

