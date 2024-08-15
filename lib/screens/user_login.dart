import 'package:flutter/material.dart';
import 'package:habit_tracker/Global/global_var.dart';
import 'package:habit_tracker/resources/auth_methods';
import 'package:habit_tracker/screens/basePage.dart';
import 'package:habit_tracker/screens/user_signup.dart';
import 'package:habit_tracker/widgets/utils.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
  
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    bool isLoading = false;

   Future<void> loginUser() async {
  setState(() {
    isLoading = true;
  });
  
  String res = await AuthMethods().loginUser(
      email: _emailController.text, password: _passwordController.text);
  
  setState(() {
    isLoading = false;
  });
  
  // Check if login was successful
  if (res == 'success') {
    // Navigate to MyApp2 if login is successful
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyApp2(),
      ),
    );
    showSnackBar(context, 'Login successful!');
  } else {
    // Show error message if login failed
    showSnackBar(context, res);
  }
}



    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Login',
          style: TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariables.primaryGradient),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'User Email',
                  floatingLabelStyle:
                      TextStyle(color: Colors.purpleAccent),
                  focusColor: Colors.purpleAccent,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  floatingLabelStyle:
                      TextStyle(color: Colors.purpleAccent),
                  focusColor: Colors.purpleAccent,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.purpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 45.0),
              ElevatedButton(
                onPressed: () async {
                 
                  await loginUser();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  minimumSize: const Size(350.0, 45.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w700),
                        ),
                ),
              ),
              const SizedBox(height: 45.0),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  minimumSize: const Size(350.0, 45.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Google.png'),
                                fit: BoxFit.cover),
                          )),
                      const SizedBox(
                        width: 49,
                      ),
                      const Text(
                        'Login with Google',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 19),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not Registered yet? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const UserSignup()));
                    },
                    child: const Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.deepPurple,
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
