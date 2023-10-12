import 'package:flutter/material.dart';
import 'package:flutter_courses/04.Abdullah_Mansour/shared/components/components.dart';

class LoginDesign extends StatelessWidget {
  const LoginDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 24),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 48),
              CustomTextField(controller: emailController),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 24),
              const CustomBtn(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have account!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "SignUp",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}


