import 'package:Efectivo/features/auth/presentation/pages/sign_in_form_page.dart';
import 'package:Efectivo/features/auth/presentation/pages/splash_page.dart';
import 'package:Efectivo/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: DashboardPage),
    MaterialRoute(page: SignInFormPage)
  ],
)
class $Router {}
