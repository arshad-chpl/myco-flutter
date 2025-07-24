import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/lost_and_found/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/chat_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/lost_and_found.dart';

List<RouteBase> LostAndFoundRoutes = [
  GoRoute(
    path: RoutePaths.lostAndFoundAddScreen,
    name: 'lost-and-found-add-screen',
    builder: (context, state) => const LostAndFoundAddScreen(),
  ),

  GoRoute(
    path: RoutePaths.lostAndFoundChatScreen,
    name: 'lost-and-found-chat-screen',
    builder: (context, state) => ChatScreen(),
  ),
  GoRoute(
    path: RoutePaths.lostAndFoundItemDetails,
    name: 'lost-and-found-item-details',
    builder: (context, state) {
      LostAndFoundItemModel lostitem = state.extra as LostAndFoundItemModel;
      return ItemDetailsScreen(item: lostitem);
    },
  ),

  GoRoute(
    path: RoutePaths.lostAndFound,
    name: 'lost-and-found',
    builder: (context, state) => const LostAndFound(),
  ),
];