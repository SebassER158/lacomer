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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Image.asset("assets/isotipo_login.png")
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Image.asset("assets/logotipo.png")
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Correo Electrónico",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(HomeScreen.route());
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff85e11)
              ),
              child: const Text("Iniciar sesion")  
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: (){
                  //navega a registro
                },
                child: const Text("¿No tienes cuenta? Registrate",
                  style: TextStyle(color: Color(0xfff85e11), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Divider(color: Colors.black, thickness: 2),
                  Text("O inicia sesion con",
                    style: TextStyle(color: Color(0xfff85e11), fontWeight: FontWeight.bold),
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
    );
  }
}
