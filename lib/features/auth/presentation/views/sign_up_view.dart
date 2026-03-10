import 'package:blog_app/base/styles/text_styles.dart';
import 'package:blog_app/base/styles/auth_theme.dart';
import 'package:blog_app/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:blog_app/features/auth/presentation/notifiers/auth_error_notifier.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final authTheme = theme.extension<AuthTheme>()!;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(boxShadow: []),
            height: size.height * .44,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign Up', style: TextStyles.profileHeaderText),
                SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: authTheme.authFieldRadius,
                    ),
                  ),
                ),
                (context.watch<AuthErrorNotifier>().emailEmailError.isNotEmpty)
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 5),
                            child: Text(
                              context.watch<AuthErrorNotifier>().emailEmailError,
                              style: authTheme.authErrorTextStyle,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: authTheme.authFieldRadius,
                    ),
                  ),
                ),
                (context.watch<AuthErrorNotifier>().passwordError.isNotEmpty)
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 5),
                            child: Text(
                              context.watch<AuthErrorNotifier>().passwordError,
                              style: authTheme.authErrorTextStyle,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(height: 12),
                Container(
                  width: size.width * .60,
                  decoration: BoxDecoration(
                    color: authTheme.authButtonColor,
                    borderRadius: authTheme.authButtonRadius,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await context.read<AuthNotifier>().signUpUser(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        context,
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: authTheme.authButtonTextStyle,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  child: const Text('Already registered? login here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
