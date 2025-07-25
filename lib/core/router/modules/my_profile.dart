import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/my_profile/data/models/other_profile_args_model.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/pages/my_profile_page.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_bloc.dart';
import 'package:myco_flutter/features/my_profile/presentation/pages/other_profile_page.dart';

List<RouteBase> MyProfileRoutes = [
  GoRoute(
    path: RoutePaths.myProfile,
    name: 'my-profile',
    builder: (context, state) => BlocProvider(
      create: (context) => GetIt.I<MyProfileBloc>()..add(GetProfileDataEvent()),
      child: const MyProfilePage(),
    ),
  ),
  GoRoute(
    path: '/other-profile',
    name: 'other-profile',
    builder: (context, state) {
      // Extract the strongly-typed object from 'extra'
      final args = state.extra as OtherProfilePageArgs;

      return BlocProvider(
        create: (context) => GetIt.I<MyProfileBloc>()
          ..add(GetOtherProfileDataEvent(
            userId: args.userId,
            societyId: args.societyId,
            unitId: args.unitId,
            blockId: args.blockId,
            floorId: args.floorId,
            myUserId: args.myUserId,
            myProfile: args.myProfile,
            getProfileMenuDetails: 'getProfileMenuDetails',
            otherUserBlockId: args.otherUserBlockId,
            otherUserFloorId: args.otherUserFloorId,

          )),
        child: const OtherProfilePage(),
      );
    },
  ),
];
