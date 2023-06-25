import 'package:flutter/material.dart';
import 'package:listbook_project/ui/dashboard.dart';
import '../service/login_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Login listBook",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
              Text(
                "admin@listBook.com",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          SizedBox(height: 10),
                          _passwordTextField(),
                          SizedBox(height: 40),
                          _tombolLogin(),
                        ],
                      ),
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5),
      ),
      controller: _usernameCtrl,
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5),
      ),
      obscureText: true,
      controller: _passwordCtrl,
      style: TextStyle(
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget _tombolLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              BorderSide(color: Colors.cyan.shade300)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          await LoginService().login(username, password).then((value) {
            if (value == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text(
                  "Username / Password Tidak Valid",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.cyan.shade300,
                      side: BorderSide(color: Colors.cyan.shade300),
                    ),
                  )
                ],
              );
              showDialog(
                context: context,
                builder: (context) => alertDialog,
              );
            }
          });
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );
  }
}
