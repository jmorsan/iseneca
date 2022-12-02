import 'package:iseneca/screens/home_screen.dart';
import 'package:iseneca/themes/app_theme.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/models/models.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: true);
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    //return UserSucess(context, args);
    return FutureBuilder(
        future: usersProvider.getJsonData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<User> usuarios = snapshot.data;
            for (var user in usuarios) {
              if (user.usuario == args['usuario'] &&
                  user.clave == args['clave']) {
                return userSucess(context, args['usuario']);
              }
            }
          } else {
            return userDenied();
          }

          return const HomeScreen(
            failAcces: false,
          );
        });
  }

  SizedBox userDenied() {
    return const SizedBox(
      height: 400.0,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Scaffold userSucess(BuildContext context, String? args) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primary,
        title: const Text("Login"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.menuOption[0].route, (_) => false);
              },
              icon: const Icon(Icons.login))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        const SizedBox(height: 30),
        const Image(
          image: AssetImage('assets/iseneca .png'),
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
