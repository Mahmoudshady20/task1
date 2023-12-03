import 'package:flutter/material.dart';
import 'package:untitled5/config/component/custom_form_field.dart';
import 'package:untitled5/pages/login_page/login_screen.dart';

import '../../config/utils/validations_regex.dart';

class SignupScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  static const String routeName = 'signupScreen';
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Create New',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Already Registered? ',
                      style: Theme.of(context).textTheme.headlineMedium),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      child: Text('Log In Here',
                          style: Theme.of(context).textTheme.headlineMedium))
                ],
              ),
              CustomFormField( label: 'Full Name',
                controller: nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              CustomFormField(
                  label: 'Email Adrress',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your Email';
                    }
                    if (!ValidationRegex.emailRegex(value)) {
                      return 'Please enter Valid Email';
                    }
                    return null;
                  }),
              StatefulBuilder(
                builder: (context, setState) => CustomFormField(
                  label: 'password',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your Password';
                    }
                    if (!ValidationRegex.passwordRegex(value)){
                      return 'Please enter valid Password';
                    }
                    return null;
                  },
                  isPassword: hidePassword,
                  suffix: IconButton(
                    onPressed: () {
                      if (hidePassword == false) {
                        hidePassword = true;
                      } else {
                        hidePassword = false;
                      }
                      setState(() {});
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              StatefulBuilder(
                builder: (context, setState) => CustomFormField(
                  label: 'confirm password',
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'please enter password-confirmation';
                    }
                    if (passwordController.text != value) {
                      return "password doesn't match";
                    }
                    return null;
                  },
                  isPassword: hideConfirmPassword,
                  suffix: IconButton(
                    onPressed: () {
                      if (hideConfirmPassword == false) {
                        hideConfirmPassword = true;
                      } else {
                        hideConfirmPassword = false;
                      }
                      setState(() {});
                    },
                    icon: hideConfirmPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(
                  horizontal: 30
                ),
                decoration: BoxDecoration(
                  color:  const Color(0xFF07313E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                    onPressed: () {
                      register();
                    },
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
  }
}
// d4f0fc
