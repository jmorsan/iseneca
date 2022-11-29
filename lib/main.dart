import 'package:iseneca/routes/app_routes.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iseneca/providers/users_providers.dart';



void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: ( _ ) => UsersProvider(),lazy: false,)

      ],
      child: const MyApp(),

    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),

      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme:  AppTheme.darkTheme 
    );
  }
}
