

import 'package:flutter/material.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/screens/screens.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:iseneca/widgets/widgets.dart';
import 'package:http/http.dart' as http;



class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'usuario' : 'Fernando',
      'password' : '123456',
      
    };

    return  Scaffold(
   
      body: Stack(
        children:[
          const Background(),
          Login(myFormKey: myFormKey, formValues: formValues,)
        ] ),
    );
  }
}

class Login extends StatelessWidget {
  
  const Login({
    Key? key,
    required this.myFormKey,
    required this.formValues, required this.usersProvider,
  }) : super(key: key);

  final GlobalKey<FormState> myFormKey;
  final Map<String, String> formValues;
  final UsersProvider usersProvider;

  void comprobarUsuario(BuildContext context) async {
    final usuarios = await usersProvider.getUsers(); //usuariosProvider lo hemos
								      //definido como atributo.
    usuarios.forEach((user) {
      if (user.usuario == formValues && user.clave == formValues)
        Navigator.pushNamed(context, 'menu', arguments: formValues);
    });
  }

  


 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        
        child: Form(
          key: myFormKey,
          child: Column(
            children:  [

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
                labelText: 'Nombre' , 
                hintText: 'Nombre del usuario'),

              const SizedBox(height: 30),
              
              CustomInputFieldPassword(
                
                formProperty: 'password',
                formValues: formValues, 
                labelText: 'Contraseña' , 
                hintText: 'Contraseña del usuario', 
                obscureText: true),

              const SizedBox(height: 30),
        
              ElevatedButton(
                child:const  SizedBox(
                
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text('Loggin',style: TextStyle(color: AppTheme.primary,fontSize: 30),),)),
                onPressed: ()  {
                  
                  comprobarUsuario(context);
          

                 

                  FocusScope.of(context).requestFocus(FocusNode());
                  if(!myFormKey.currentState!.validate()){
                    print('Datos Invalidos');
                    return;
                  
                  }
                  else if(formValues['usuario']=='aaa' && formValues['password']=='aaa')
                  {
                  
                    Navigator.push(context,
                      MaterialPageRoute(                      
                        builder: (context) =>  DashboardScreen(username: formValues['usuario'], password: formValues['password'])
                      )
                    );
                  }
                    // Todo: imprimir valores del formulario
                }, 
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

class Background extends StatelessWidget{
  const Background({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0,8],
          colors: [
            Color(0xff005298),
            Color(0xff01315a)
          ],
        ),
      ),
    );
  }
}