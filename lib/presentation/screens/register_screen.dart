import 'package:flutter/material.dart';
import 'package:flutter_forms/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New User')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 100),
              const _RegisterForm(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            iconSuffix: Icons.supervised_user_circle_outlined,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'e-mail',
            iconSuffix: Icons.email_outlined,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            iconSuffix: Icons.password,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Create User'),
          ),
        ],
      ),
    );
  }
}
