
import 'package:cartao/data/task_inherited.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CardInherited(
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 500,
                width: 375,
                decoration: const BoxDecoration(
                  color: Colors.white10,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0),
                      child: ClipRRect (
                        child: Image.asset('assets/images/logo.png'),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Coloque seu e-mail';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'E-mail',
                          fillColor: Colors.white12,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Coloque seu CPF';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: cpfController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'CPF',
                          fillColor: Colors.white12,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Digite uma senha';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Senha',
                          fillColor: Colors.white12,
                          filled: true,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Cadastrando usuário')));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (contextNew) => const HomeScreen(),
                              ));
                        }
                      },
                      child: const Text('Cadastrar!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}