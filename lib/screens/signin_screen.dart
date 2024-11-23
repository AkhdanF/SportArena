import 'package:flutter/material.dart';
import 'package:sportsarena/screens/home_screen.dart';
import 'package:sportsarena/screens/signup_screen.dart';
import 'package:sportsarena/screens/admin_dashboard_screen.dart';
import 'package:sportsarena/widgets/custom_scaffold.dart';
import 'package:sportsarena/widgets/profile_data.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextStyle inputTextStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
        child: Form(
          key: _formSignInKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                style: inputTextStyle,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your username',
                  hintStyle: inputTextStyle,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                style: inputTextStyle,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your password',
                  hintStyle: inputTextStyle,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  Checkbox(
                    value: rememberPassword,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberPassword = value ?? false;
                      });
                    },
                    activeColor: Colors.deepPurpleAccent,
                  ),
                  const Expanded(
                    child: Text(
                      'Remember Me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formSignInKey.currentState!.validate()) {
                      final username = _usernameController.text;
                      final password = _passwordController.text;

                      if (isAccountRegistered(username, password)) {
                        if (username == 'admin' && password == 'password') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminDashboardScreen(),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account not registered'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0,
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have An Account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
