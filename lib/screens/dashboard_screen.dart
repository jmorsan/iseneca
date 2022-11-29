import 'package:iseneca/themes/app_theme.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: const Text("Login"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, AppRoutes.menuOption[0].route);
              },
              icon: const Icon(Icons.login))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        const SizedBox(height: 30),
        const Image(
          image: AssetImage('assets/iseneca_azul.png'),
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
        ),
        Text(
          args.toString(),
          style: const TextStyle(color: AppTheme.primary, fontSize: 30),
        ),
      ]),
    );
  }
}
