import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/auth_controller.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _authController = AuthController();

  late String email;
  late String fullName;
  late String phoneNumber;
  late String password;

  _signUpUser() async{
    String res = await _authController.signUpUsers(email, fullName, phoneNumber, password);

    if(res != 'success'){
      print(res);
    } else{
      print('Good');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Criar Conta do Cliente',
                style: TextStyle(fontSize: 20),
              ),
              CircleAvatar(
                radius: 54,
                backgroundColor: Colors.yellow.shade900,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value){
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value){
                    fullName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value){
                    phoneNumber = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value){
                    password = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _signUpUser();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text('Login'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
