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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            iconSuffix: Icons.supervised_user_circle_outlined,
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              if (value.length < 6) {
                return 'Username must be longer than six characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'e-mail',
            iconSuffix: Icons.email_outlined,
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) {
                return 'Field does not have email format';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            iconSuffix: Icons.password,
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Field required';
              if (value.trim().isEmpty) return 'Field required';
              if (value.length < 6) {
                return 'Password must be longer than six characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
            },
            icon: const Icon(Icons.save),
            label: const Text('Create User'),
          ),
        ],
      ),
    );
  }
}
