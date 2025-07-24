import 'package:equatable/equatable.dart';

sealed class MyProfileEvent  extends Equatable {
  const MyProfileEvent();
  @override
  List<Object?> get props => [];
}

class FetchProfileDataEvent extends MyProfileEvent {
  const FetchProfileDataEvent();

  @override
  List<Object?> get props => [];
}