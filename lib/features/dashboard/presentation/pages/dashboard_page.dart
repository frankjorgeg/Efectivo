import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routers/router.gr.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: _BuildDashboard(),
    );
  }
}

class _BuildDashboard extends StatelessWidget {
  const _BuildDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          ExtendedNavigator.of(context).replace(Routes.signInFormPage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () => context.bloc<AuthCubit>()..signedOut(),
            )
          ],
        ),
        body: Container(
          child: Center(child: Text('Bienvenido')),
        ),
      ),
    );
  }
}
