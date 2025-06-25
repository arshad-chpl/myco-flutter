import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final PreferenceManager _preference = GetIt.I<PreferenceManager>();
  bool _canNavigate = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && _canNavigate) {
        _navigateNext();
      }
    });
    _preference.clearSecureStorageOnFreshInstall();
  }

  Future<void> _navigateNext() async {
    final isLoggedIn = await _preference.getLoginSession();
    if (!mounted) return;
    context.go(isLoggedIn ?? false ? '/home' : RoutePaths.selectCompany);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
    listener: (context, state) {
      switch (state) {
        case SplashLoaded():
          _canNavigate = true;
          // if (_controller.status == AnimationStatus.completed) {
          //   _navigateNext();
          // }
          break;

        case SplashForceUpdate(versionInfo: final versionInfo):
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const CustomText('Update Required'),
              content: CustomText(
                'Please update to version ${versionInfo.latestVersion} to continue.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // TODO: Launch Play Store link
                  },
                  child: const CustomText('Update Now'),
                ),
              ],
            ),
          );
          break;

        case SplashError(message: final message):
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: CustomText(message)));
          });
          break;

        default:
          break;
      }
    },
    child: Scaffold(
      backgroundColor: AppColors.myCoCyan,
      body: Center(
        child: Lottie.asset(
          'assets/splash/myco_splash.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
          height: 400,
          width: 400,
        ),
      ),
    ),
  );
}
