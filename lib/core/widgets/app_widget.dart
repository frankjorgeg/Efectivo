import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../injection.dart';
import '../routers/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>()..authCheckRequested(),
        )
      ],
      child: MaterialApp(
        title: 'Efectivo App',
        builder: ExtendedNavigator(router: Router()),
        theme: ThemeData.light().copyWith(
          accentColor: Colors.indigoAccent,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
