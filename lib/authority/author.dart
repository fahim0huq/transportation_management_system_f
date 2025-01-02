import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'author_options.dart';


class Author extends StatefulWidget {
  const Author({super.key});

  @override
  State<Author> createState() => _AuthState();
}
class _AuthState extends State<Author> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:const Text("Authority",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key:_formKey,
              child: SizedBox(
                width: screenWidth * 0.8,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your Email Adress',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //---
                      },
                    ),
                    const SizedBox(height: 12,),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple.shade300,
                            minimumSize: const Size(150, 55),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 5,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(child: CircularProgressIndicator()),
                              );

                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                Navigator.pop(context); // Close the loading dialog
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AuthorOptions()),
                                );
                              } on FirebaseAuthException catch (e) {
                                Navigator.pop(context); // Close the loading dialog
                                String errorMessage = (e.code == 'user-not-found')
                                    ? 'No user found for that email.'
                                    : (e.code == 'wrong-password')
                                    ? 'Incorrect password.'
                                    : 'An error occurred. Please try again.';
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(errorMessage),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },

                          child: const Text('Submit',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height:  32,),
                        Container(
                          height: 0.5,
                          width: double.infinity,
                          color: Colors.purple.shade300,
                        ),
                        const SizedBox(height:  32,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.purple.shade300,
                            minimumSize: const Size(150, 55),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 5,
                          ),
                          onPressed: () {
                            ///---
                          },
                          child: const Text('Apply For Authority Access',
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}