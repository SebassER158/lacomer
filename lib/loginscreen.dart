import 'package:flutter/material.dart';
import 'package:lacomer/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Image.asset("assets/isotipo_login.png")),
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Image.asset("assets/logotipo.png")),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Correo Electrónico",
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: "Contraseña",
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(HomeScreen.route());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff85e11)),
                  child: const Text(
                    "Iniciar sesion",
                    style: TextStyle(fontFamily: 'Helvetica Neue'),
                  )),
              Container(
                margin: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    //navega a registro
                  },
                  child: const Text(
                    "¿No tienes cuenta? Registrate",
                    style: TextStyle(
                        color: Color(0xfff85e11),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Helvetica Neue'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Divider(color: Colors.black, thickness: 2),
                    Text(
                      "O inicia sesion con",
                      style: TextStyle(
                          color: Color(0xfff85e11),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue'),
                    ),
                    Divider(color: Colors.black, thickness: 2),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Image.asset("assets/facebook.png"),
                    ),
                    GestureDetector(
                      child: Image.asset("assets/ios.png"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
