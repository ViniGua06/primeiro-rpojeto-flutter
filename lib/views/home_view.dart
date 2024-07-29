import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:teste/controller/user_controller.dart';
import 'package:teste/models/user_model.dart';
import 'package:teste/views/components/textfield_component.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserController controller = UserController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _signUp() async {
    try {
      setState(() {
        _isLoading = true;
      });

      UserModel user = new UserModel(_nameController.text,
          _emailController.text, _passwordController.text, "");

      String message = await controller.signUp(user);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));

      if (message == "Cadastrado") {
        Navigator.of(context).pushReplacementNamed("/user");
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e as String)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(204, 0, 51, 255),
          child: Center(
            child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Cadastro",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(204, 0, 51, 255),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: TextFieldComponent(
                            title: "Nome",
                            isPassword: false,
                            controller: _nameController,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            child: TextFieldComponent(
                          title: "Email",
                          isPassword: false,
                          controller: _emailController,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: TextFieldComponent(
                            title: "Senha",
                            isPassword: true,
                            controller: _passwordController,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _isLoading ? null : _signUp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 51, 255),
                          ),
                          child: !_isLoading
                              ? Text("Enviar",
                                  style: TextStyle(color: Colors.white))
                              : CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
