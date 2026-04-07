import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/back_to_login.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_container.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_header.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/email_verification_view_icon.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/open_email_button.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/resend_email_verification_widget.dart';

class EmailVerificationViewBody extends StatefulWidget {
  const EmailVerificationViewBody({super.key, required this.enteredEmail});
  final String enteredEmail;

  @override
  State<EmailVerificationViewBody> createState() =>
      _EmailVerificationViewBodyState();
}

class _EmailVerificationViewBodyState extends State<EmailVerificationViewBody> {
  Timer? timer;
  @override
  void initState() {
    isPolling(); // Firebase check every 3 seconds if email is verified or not
    super.initState();
  }

  void isPolling() {
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (mounted) {
        context.read<AuthCubit>().checkEmailVerified();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthEmailVerifiedState) {
          // email is verified stop polling and go to login view
          timer?.cancel();
          //snackbar
          context.go(AppRoutes.login);
        } else if (state is AuthErrorState) {
          // snackbar
        }
      },
      child: CustomViewBody(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmailVerificationIcon(),
            const SizedBox(height: 36),
            EmailVerificationHeader(enteredEmail: widget.enteredEmail),
            const SizedBox(height: 36),
            OpenEmailButton(),
            const SizedBox(height: 36),
            BackToLoginWidget(),
            const SizedBox(height: 60),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return ResendEmailVerificationWidget(
                  onTap: () {
                    context.read<AuthCubit>().resendEmailVerification();
                  },
                );
              },
            ),
            const Spacer(),
            EmailVerificationContainer(),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
