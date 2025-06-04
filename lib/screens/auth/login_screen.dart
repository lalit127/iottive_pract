import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iottive_pract/blocs/auth/auth_bloc.dart';
import 'package:iottive_pract/blocs/auth/auth_event.dart';
import 'package:iottive_pract/blocs/auth/auth_state.dart';
import 'package:iottive_pract/common/app_button.dart';
import 'package:iottive_pract/common/app_text_field.dart';
import 'package:iottive_pract/config/app_colors.dart';
import 'package:iottive_pract/config/app_text_styles.dart';
import 'package:iottive_pract/gen/assets.gen.dart';
import 'package:iottive_pract/utils/app_routes.dart';
import 'package:iottive_pract/utils/base_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      context.read<AuthBloc>().add(
        LoginRequest(email: email, password: password),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email & password')),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.appWhiteColor,
              image: DecorationImage(
                image: AssetImage(Assets.images.shoppingBg.path),
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SafeArea(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.userModel != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successful')),
                    );
                    context.go(Routes.home);
                  } else if (state.error != null) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error!)));
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: AppTextStyles(context).display32W400
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                              8.0.toVSB,
                              Text(
                                'Enter your login details',
                                style: AppTextStyles(context).display16W400
                                    .copyWith(color: AppColors.black54),
                              ),
                              isPortrait
                                  ? (size.height * 0.3).toVSB
                                  : 20.0.toVSB,
                              AppTextField(
                                controller: emailController,
                                prefixWidget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                    8.0.toHSB,
                                    Container(
                                      width: 2,
                                      height: 24,
                                      color: AppColors.grayLight,
                                    ),
                                  ],
                                ),
                                hintText: 'Enter email',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!isValidEmail(value.trim())) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              16.0.toVSB,
                              AppTextField(
                                controller: passwordController,
                                obscureText: true,
                                isPasswordField: true,
                                prefixWidget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.lock_outline,
                                      color: AppColors.primaryColor,
                                    ),
                                    8.0.toHSB,
                                    Container(
                                      width: 2,
                                      height: 24,
                                      color: AppColors.grayLight,
                                    ),
                                  ],
                                ),
                                hintText: 'Enter password',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.trim().length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              32.0.toVSB,
                              AppButton(
                                onPressed: _onLoginPressed,
                                text:
                                    state.isLoading
                                        ? 'Logging In...'
                                        : 'Log In',
                                width: isPortrait ? size.width : 300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      state.isLoading
                          ? Positioned.fill(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.grayLight,
                              ),
                            ),
                          )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
