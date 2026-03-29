import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';
import 'package:stock_mate/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is SplashAuthenticatedState){
            //Navigate to Dashboard View
          }else{
            if(state is SplashUnauthenticatedState){
              //Navigate to Login view
            }
          }
        },
        child: SplashViewBody(),
      ),
    );
  }
}
