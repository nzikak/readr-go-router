import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/book/home/home_screen.dart';
import 'package:readr/providers/user_provider.dart';
import 'package:readr/utils/constants/images.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(Images.kLogo),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserProvider>().setLoggedIn();

                          },
                          child: const Text("Login"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
