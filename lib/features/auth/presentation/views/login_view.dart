import 'package:blog_app/core/styles/app_theme.dart';
import 'package:blog_app/core/styles/styles.dart';
import 'package:blog_app/features/auth/presentation/controllers/auth_notifier.dart';
import 'package:blog_app/features/auth/presentation/notifiers/auth_error_notifier.dart';
import 'package:blog_app/core/utils/constants/auth_strings.dart';
import 'package:blog_app/core/generics/loading_sc_dialog.dart';
import 'package:blog_app/core/utils/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    final authTheme = theme.extension<AppTheme>()!;

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
                const Text(
                  AuthStrings.loginTitle,
                  style: TextStyles.profileHeaderText,
                ),
                SizedBox(height: 25),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: AuthStrings.emailHint,
                    border: OutlineInputBorder(
                      borderRadius: authTheme.authFieldRadius,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: AuthStrings.passwordHint,
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
                SizedBox(height: 12),
                Container(
                  width: size.width * .60,
                  decoration: BoxDecoration(
                    color: authTheme.authButtonColor,
                    borderRadius: authTheme.authButtonRadius,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      showLoadingScreen(context);
                      bool didLogin = false;
                      try {
                        didLogin = await context.read<AuthNotifier>().loginUser(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          context,
                        );
                      } finally {
                        if (mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                      if (!mounted || !didLogin) {
                        return;
                      }
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil(profileRoute, (_) => false);
                    },
                    child: Text(
                      AuthStrings.loginTitle,
                      style: authTheme.authButtonTextStyle,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(signUpRoute, (route) => false);
                  },
                  child: const Text(AuthStrings.goToSignUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



