import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routers/router.gr.dart';
import '../cubit/auth_cubit.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          ExtendedNavigator.of(context).replace(Routes.signInFormPage);
        } else if (state is Authenticated) {
          ExtendedNavigator.of(context).replace(Routes.dashboardPage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(strokeWidth: 2.0),
          ),
        );
      },
    );
  }
}

class Routers {}
