part of 'on_bording_cubit.dart';

@immutable
sealed class OnBordingState {}

final class OnBordingInitial extends OnBordingState {}

final class OnBordingLoading extends OnBordingState {}

final class OnBordingSuccess extends OnBordingState {}

final class OnBordingError extends OnBordingState {}
