
import 'package:iseneca/themes/app_theme.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String? username;
  final String? password;
  const DashboardScreen({Key? key, required this.username, this.password}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.popAndPushNamed(context, AppRoutes.menuOption[0].route);
            },
             icon: const Icon(Icons.login)
             )
        ],
      ),

      backgroundColor: Colors.white,
      
      body: Column(

         children:[

          const SizedBox(height: 30),

          const Image(
            image: AssetImage('assets/iseneca_azul.png'),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            ),


          Text(username.toString(),style: const TextStyle(color: AppTheme.primary,fontSize: 30),),

         ] 
      ),
    );
  }
}