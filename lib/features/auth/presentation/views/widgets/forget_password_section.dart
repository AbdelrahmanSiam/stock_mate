import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/auth/presentation/views/helper/auth_helper.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class ForgetPasswordSection extends StatefulWidget {
  const ForgetPasswordSection({super.key});

  @override
  State<ForgetPasswordSection> createState() => _ForgetPasswordSectionState();
}

class _ForgetPasswordSectionState extends State<ForgetPasswordSection> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthPasswordResetSentState) {
          AppSnackBar.show(
            context,
            message: S.of(context).resetLinkSent,
            type: SnackBarType.info,
          );
          context.pop();
        } else if (state is AuthErrorState) {
          AppSnackBar.show(
            context,
            message: state.errMessage,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoadingState;
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomAuthTextField(
                label: S.of(context).email,
                labelColor: AppColorsDarkMode.primary,
                hint: "admin@gmail.com",
                prefixIcon: Icons.email,
                controller: emailController,
                validator: (value) {
                  return emailVerificationMethod(value, context);
                },
              ),
              const SizedBox(height: 28),
              CustomButton(
                onPressed: isLoading
                    ? null
                    : () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().sendPasswordReset(
                            email: emailController.text.trim(),
                          );
                        }
                      },
                isLoading: isLoading,
                buttonName: S.of(context).sendResetLink,
                color: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
