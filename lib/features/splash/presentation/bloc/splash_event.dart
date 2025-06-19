part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashCheckVersion extends SplashEvent {
  final String currentVersion;

  const SplashCheckVersion(this.currentVersion);

  @override
  List<Object> get props => [currentVersion];
}
class LoadSplash extends SplashEvent {}
