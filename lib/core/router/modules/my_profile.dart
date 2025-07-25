import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/pages/my_profile_page.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_bloc.dart';

List<RouteBase> MyProfileRoutes = [
  GoRoute(
    path: RoutePaths.myProfile,
    name: 'my-profile',
    builder: (context, state) => BlocProvider(
      create: (context) => GetIt.I<MyProfileBloc>()..add(GetProfileDataEvent()),
      child: const MyProfilePage(),
    ),
  ),
];
