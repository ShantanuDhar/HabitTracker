
import 'package:flutter/material.dart';
import 'package:habit_tracker/Global/global_var.dart';
import 'package:habit_tracker/resources/auth_methods';
import 'package:habit_tracker/screens/user_login.dart';
import 'package:habit_tracker/widgets/utils.dart';
class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpassController = TextEditingController();

  bool isLoading = false;
  Future<void> signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _nameController.text,
     );
    setState(() {
      isLoading = false;
    });
    if (res != 'Success') {
      showSnackBar(context, res);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const UserLogin(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User SignUp ',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariables.primaryGradient),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
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
                  controller: _emailController,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purpleAccent),
                    ),
                    labelText: 'User Email',
                    floatingLabelStyle:
                        TextStyle(color: Colors.purpleAccent),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purpleAccent),
                    ),
                    labelText: 'Password',
                    floatingLabelStyle:
                        TextStyle(color: Colors.purpleAccent),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _cpassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purpleAccent),
                    ),
                    labelText: 'Confirm Password',
                    floatingLabelStyle:
                        TextStyle(color: Colors.purpleAccent),
                  ),
                ),
               
                const SizedBox(height: 45.0),
                // ElevatedButton(
                //   onPressed: () async {
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (context) => const UserLogin(),
                //       ),
                //     );
                //     await signUpUser();
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.deepPurple[400],
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     minimumSize: const Size(350.0, 45.0),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: isLoading
                //         ? const CircularProgressIndicator()
                //         : const Text(
                //             'Sign Up',
                //             style: TextStyle(color: Colors.black, fontSize: 16),
                //           ),
                //   ),
                // ),
                Center(
                  child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const UserLogin(),
                        ),
                      );
                    await signUpUser();
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
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          ),
                  ),
                                ),
                ),
                const SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const UserLogin()
                        ));
                      },
                      child: const Text(
                        'Login',
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
      ),
    );
  }
}
