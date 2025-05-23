import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserProfile userProfile) =
      _Authenticated;
  const factory AuthState.unauthenticated({String? message}) = _Unauthenticated;
}
