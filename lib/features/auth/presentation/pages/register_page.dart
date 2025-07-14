import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/utils/widgets/button.dart';
import 'package:dating_app/core/utils/widgets/input.dart';
import 'package:dating_app/core/utils/widgets/social_button.dart';
import 'package:dating_app/features/auth/presentation/bloc/app_state.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:dating_app/initializer.dart';
import 'package:dating_app/router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                    S.of(context).welcome,
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
                    hintText: S.of(context).nameSurname,
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),

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
                    showSuffixIcon: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),

                  InputWidget(
                    icon: Icons.lock_outline,
                    hintText: S.of(context).confirmPassword,
                    isPassword: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: S.of(context).termsAndConditionsPart1,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: S.of(context).termsAndConditionsPart2,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).termsAndConditionsPart3,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

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
                              text: S.of(context).registerNow,
                              isLoading: isLoading,
                              onPressed: () {
                                FocusScope.of(context).unfocus();

                                final email = emailController.text.trim();
                                final password = passwordController.text;
                                final confirmPassword =
                                    confirmPasswordController.text;
                                final name = nameController.text.trim();

                                if (email.isEmpty ||
                                    password.isEmpty ||
                                    confirmPassword.isEmpty ||
                                    name.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        S.of(context).fillAllFieldsRequired,
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                if (password != confirmPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        S.of(context).passwordsDoNotMatch,
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                // Firebase Analytics event
                                final analytics = getIt<FirebaseAnalytics>();

                                analytics.logEvent(
                                  name: 'register_button_clicked',
                                  parameters: {'method': 'email'},
                                );

                                context.read<AuthBloc>().add(
                                  RegisterSubmitted(
                                    name,
                                    email,
                                    password,
                                    confirmPassword,
                                  ),
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
                        S.of(context).doHaveAnAccount,
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
                            RouteGenerator.loginScreen,
                          );
                        },
                        child: Text(
                          S.of(context).loginHint,
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
