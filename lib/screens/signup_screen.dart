import 'package:flutter/material.dart';
import 'package:sportsarena/widgets/custom_scaffold.dart';
import 'package:sportsarena/widgets/profile_data.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreeTerms = false;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please agree to our terms and conditions.'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      final username = _usernameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      ProfileData newProfile = ProfileData(
        username: username,
        email: email,
        password: password,
      );
      registeredUsers.add(newProfile);

      Navigator.pop(context);
    }
  }

  void _navigateToSignIn() {
    Navigator.pushNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your username',
                  hintStyle: const TextStyle(color: Colors.white),
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
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Colors.white),
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
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.white),
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
                    value: _agreeTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _agreeTerms = value ?? false;
                      });
                    },
                    activeColor: Colors.deepPurpleAccent,
                  ),
                  const Expanded(
                    child: Text(
                      'I agree to the Terms & Conditions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signUp,
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
                    'Sign up',
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
                    "Already Have An Account? ",
                    style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: _navigateToSignIn,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.purpleAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),

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
