import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/utils/widgets/button.dart';
import 'package:dating_app/core/utils/widgets/input.dart';
import 'package:dating_app/core/utils/widgets/social_button.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dating_app/features/auth/presentation/bloc/app_state.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:dating_app/initializer.dart';
import 'package:dating_app/router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).login,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    S.of(context).loginContent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),

                  InputWidget(
                    icon: Icons.email_outlined,
                    hintText: S.of(context).email,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),

                  InputWidget(
                    icon: Icons.lock_outline,
                    hintText: S.of(context).password,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).forgotPassword,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  BlocListener<AuthBloc, AppState>(
                    listener: (context, state) {
                      if (state is MethodSuccess) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteGenerator.homeScreen,
                        );
                      } else if (state is MethodFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    child: Column(
                      children: [
                        BlocBuilder<AuthBloc, AppState>(
                          builder: (context, state) {
                            final isLoading = state is MethodLoading;

                            return AppButton(
                              isLoading: isLoading,
                              text: S.of(context).login,
                              onPressed: () {
                                FocusScope.of(context).unfocus();

                                final email = emailController.text.trim();
                                final password = passwordController.text;

                                if (email.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        S.of(context).fillAllFieldsRequired,
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                // Firebase Analytics event
                                final analytics = getIt<FirebaseAnalytics>();

                                analytics.logEvent(
                                  name: 'login_button_clicked',
                                  parameters: {'method': 'email'},
                                );
                                context.read<AuthBloc>().add(
                                  LoginSubmitted(email, password),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(icon: Icons.g_mobiledata),
                      const SizedBox(width: 16),
                      SocialButton(icon: Icons.apple),
                      const SizedBox(width: 16),
                      SocialButton(icon: Icons.facebook),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).dontHaveAnAccount,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteGenerator.registerScreen,
                          );
                        },
                        child: Text(
                          S.of(context).register,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
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
      ),
    );
  }
}
