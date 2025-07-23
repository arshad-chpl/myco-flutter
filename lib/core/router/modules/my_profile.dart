import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/my_profile_page.dart';

List<RouteBase> MyProfileRoutes =[
  GoRoute(
    path: RoutePaths.myProfile,
    name: 'my-profile',
    builder: (context, state) => const MyProfilePage(),
  ),
];