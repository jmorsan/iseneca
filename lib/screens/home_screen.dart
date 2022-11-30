import 'package:flutter/material.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/routes/app_routes.dart';
import 'package:iseneca/screens/screens.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:iseneca/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.failAcces}) : super(key: key);
  final bool failAcces;

  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: true);

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'usuario': 'Fernando',
      'clave': '123456',
    };

    return Scaffold(
      body: Stack(children: [
        const Background(),
        Login(
          myFormKey: myFormKey,
          formValues: formValues,
          usersProvider: usersProvider,
          failAcess: failAcces,
        ),
      ]),
    );
  }
}

class Login extends StatelessWidget {
  const Login({
    Key? key,
    required this.myFormKey,
    required this.formValues,
    required this.usersProvider,
    required this.failAcess,
  }) : super(key: key);

  final GlobalKey<FormState> myFormKey;
  final Map<String, String> formValues;
  final UsersProvider usersProvider;
  final bool failAcess;

  // Ventana pop -> Contraseña o usuario incorrectos
  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible:
            true, // al crear la alerta si pulsas detras se quita o no
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15)),
            elevation: 5,
            title: const Text(
              'ERROR',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('Contraseña o Usuario icorrectos'),
              SizedBox(height: 25),
              Icon(
                Icons.heart_broken,
                size: 75,
                color: Colors.red,
              ),
            ]),
            actions: [
              TextButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen(failAcces: true)),
                    (route) => false),
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (!failAcess) {
      Future.delayed(Duration.zero, () {
        displayDialogAndroid(context);
      });
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Image(
                image: AssetImage('assets/iseneca .png'),
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 80),
              CustomInputField(
                  formProperty: 'usuario',
                  formValues: formValues,
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario'),
              const SizedBox(height: 30),
              CustomInputFieldPassword(
                  formProperty: 'clave',
                  formValues: formValues,
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  obscureText: true),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Loggin',
                        style: TextStyle(color: AppTheme.primary, fontSize: 30),
                      ),
                    )),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.menuOption[1].route,
                    arguments: formValues,
                    (_) => false),
              ),
              const SizedBox(height: 200),
              const Image(
                image: AssetImage('assets/juntaDeAndalucia.png'),
                width: double.infinity,
                height: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 8],
          colors: [Color(0xff005298), Color(0xff01315a)],
        ),
      ),
    );
  }
}
