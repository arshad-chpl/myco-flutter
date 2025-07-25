import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/di/injector.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/add_asset/add_asset_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/pages/add_assets.dart';
import 'package:myco_flutter/features/asset/presentation/pages/assets_details_page.dart';
import 'package:myco_flutter/features/asset/presentation/pages/assets_home_page.dart';
import 'package:myco_flutter/features/asset/presentation/pages/edit_assets_page.dart';
import 'package:myco_flutter/features/asset/presentation/pages/handover_assets.dart';
import 'package:myco_flutter/features/asset/presentation/pages/qr_scanner_page.dart';
import 'package:myco_flutter/features/asset/presentation/pages/swap_assets.dart';
import 'package:myco_flutter/features/asset/presentation/pages/takeover_asset.dart';

List<RouteBase> assetsRoutes = [
  GoRoute(
    path: RoutePaths.assetsHome,
    name: 'assets-home',
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider<AssetsBloc>(
          create: (_) => sl<AssetsBloc>(), // ✅ using GetIt
        ),
        // BlocProvider<AssetsTabBloc>(create: (_) => AssetsTabBloc()),
        BlocProvider<AssetsFilterBloc>(create: (_) => AssetsFilterBloc()),
      ],
      child: const AssetsHomePage(),
    ),
  ),

  GoRoute(
    path: RoutePaths.qrScanner,
    name: 'qr-scanner',
    builder: (context, state) => const QRScannerPage(),
  ),
  GoRoute(
    path: RoutePaths.assetsDetails,
    name: 'assets-details',
    builder: (context, state) => const AssetsDetailsPage(),
  ),
  GoRoute(
    path: RoutePaths.addAssets,
    name: 'add-assets',
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider<AddAssetBloc>(create: (_) => sl<AddAssetBloc>()),
      ],
      child: const AddAssets(),
    ),
  ),
  GoRoute(
    path: RoutePaths.editAssets,
    name: 'edit-assets',
    builder: (context, state) => const EditAssetsPage(),
  ),
  GoRoute(
    path: RoutePaths.handoverAssets,
    name: 'handover-assets',
    builder: (context, state) => const HandoverAssetsPage(),
  ),
  GoRoute(
    path: RoutePaths.takeoverAssets,
    name: 'takeover-assets',
    builder: (context, state) => const TakeoverAssets(),
  ),
  GoRoute(
    path: RoutePaths.swapAssets,
    name: 'swap-assets',
    builder: (context, state) => const SwapAssetsPage(),
  ),
];
