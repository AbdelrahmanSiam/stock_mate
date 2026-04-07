import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/auth_navigate_row.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/sign_in_fields.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardForm extends StatefulWidget {
  const LoginCardForm({super.key});

  @override
  State<LoginCardForm> createState() => _LoginCardFormState();
}

class _LoginCardFormState extends State<LoginCardForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          GoRouter.of(context).push(AppRoutes.dashboard);
        } else if (state is AuthErrorState) {
          // snackbar
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoadingState;
        return Form(
          key: formKey,
          child: AppCard(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            child: Column(
              children: [
                SignInFields(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                            );
                          }
                        },
                  isLoading: isLoading,
                  buttonName: S.of(context).signInButton,
                ),
                const SizedBox(height: 48),
                AuthNavigateRow(
                  text: S.of(context).haveNoAccount,
                  navName: S.of(context).registerHere,
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.register);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
