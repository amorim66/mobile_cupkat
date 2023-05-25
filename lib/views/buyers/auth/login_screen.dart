import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/buyers/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Cliente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Seu Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sua Senha',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      letterSpacing: 5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Criar uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      }));
                    },
                    child: Text(
                      'Cadastre-se',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
