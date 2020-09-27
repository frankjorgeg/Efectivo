import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routers/router.gr.dart';
import '../../../../injection.dart';
import '../sign_in_form/sign_in_form_cubit.dart';

class SignInFormPage extends StatelessWidget {
  const SignInFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInFormCubit>(),
      child: Scaffold(
        body: BlocConsumer<SignInFormCubit, SignInFormState>(
          listener: (context, state) {
            if (state is SignInFormError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is SignInFormSuccess) {
              ExtendedNavigator.of(context).replace(Routes.dashboardPage);
            }
          },
          builder: (context, state) {
            return _FormWidget();
          },
        ),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _FormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).buttonColor,
                    child: Text('Iniciar Sesión'),
                    onPressed: () => loginPressed(context),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: RaisedButton(
                    textColor: Theme.of(context).buttonColor,
                    color: Theme.of(context).primaryColor,
                    child: Text('Registrar'),
                    onPressed: () => registerPressed(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerPressed(BuildContext context) {
    final emailText = emailController.text;
    final passwordText = passwordController.text;

    return context.bloc<SignInFormCubit>().registerWithEmailAndPassword(
          emailText,
          passwordText,
        );
  }

  Future<void> loginPressed(BuildContext context) {
    final emailText = emailController.text;
    final passwordText = passwordController.text;

    return context.bloc<SignInFormCubit>().signInWithEmailAndPassword(
          emailText,
          passwordText,
        );
  }
}
