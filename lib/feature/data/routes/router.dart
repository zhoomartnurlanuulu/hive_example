import 'package:auto_route/auto_route.dart';
import 'package:auto_route/annotations.dart';
import 'package:hive_tutorial_app/screens/first_screen.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[AutoRoute(page: FirstScreen, initial: true)])
class $AppRouter {}
