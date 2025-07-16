import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/page/chat_list.dart';
import 'package:myco_flutter/features/chat/presentation/page/chat_screen.dart';
import 'package:myco_flutter/features/chat/presentation/page/groupe_detail.dart';
import 'package:myco_flutter/features/chat/presentation/page/start_chat.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';

List<RouteBase> cahatRoutes = [
  ShellRoute(
    builder: (context, state, child) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatBloc()),
        BlocProvider(create: (context) => TabbarBloc()),
      ],
      child: child,
    ),
    routes: [
      GoRoute(
        path: RoutePaths.chatList,
        name: 'chat-list',
        builder: (context, state) => ChatListScreen(),
      ),
      GoRoute(
        path: RoutePaths.userChatScreen,
        name: 'user-chat',
        builder: (context, state) => UserChatScreen(),
      ),
      GoRoute(
        path: RoutePaths.startNewChat,
        name: 'start-new-chat',
        builder: (context, state) => StartNewChat(),
      ),
       GoRoute(
        path: RoutePaths.groupInfo,
        name: 'group-info',
        builder: (context, state) => GroupInfo(),
      )
    ],
  ),
];
