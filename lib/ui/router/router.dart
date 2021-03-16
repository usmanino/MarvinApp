import 'package:auto_route/auto_route_annotations.dart';
import 'package:marvin_app/ui/app/home/home_screen.dart';

@MaterialAutoRouter(routes: [
  AdaptiveRoute(page: HomeScreen, initial: true),
])
class $AutoRouter {}
