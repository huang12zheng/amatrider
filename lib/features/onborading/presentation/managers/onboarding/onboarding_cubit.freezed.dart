// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnboardingStateTearOff {
  const _$OnboardingStateTearOff();

  _OnboardingState call(
      {bool isLoading = false,
      bool isVideoPlaying = false,
      bool playbackEnded = false,
      required PageController controller,
      int currentIndex = OnboardingState.kInitialPage}) {
    return _OnboardingState(
      isLoading: isLoading,
      isVideoPlaying: isVideoPlaying,
      playbackEnded: playbackEnded,
      controller: controller,
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $OnboardingState = _$OnboardingStateTearOff();

/// @nodoc
mixin _$OnboardingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isVideoPlaying => throw _privateConstructorUsedError;
  bool get playbackEnded => throw _privateConstructorUsedError;
  PageController get controller => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isVideoPlaying,
      bool playbackEnded,
      PageController controller,
      int currentIndex});
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  final OnboardingState _value;
  // ignore: unused_field
  final $Res Function(OnboardingState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isVideoPlaying = freezed,
    Object? playbackEnded = freezed,
    Object? controller = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoPlaying: isVideoPlaying == freezed
          ? _value.isVideoPlaying
          : isVideoPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      playbackEnded: playbackEnded == freezed
          ? _value.playbackEnded
          : playbackEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$OnboardingStateCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(
          _OnboardingState value, $Res Function(_OnboardingState) then) =
      __$OnboardingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isVideoPlaying,
      bool playbackEnded,
      PageController controller,
      int currentIndex});
}

/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(
      _OnboardingState _value, $Res Function(_OnboardingState) _then)
      : super(_value, (v) => _then(v as _OnboardingState));

  @override
  _OnboardingState get _value => super._value as _OnboardingState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isVideoPlaying = freezed,
    Object? playbackEnded = freezed,
    Object? controller = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_OnboardingState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoPlaying: isVideoPlaying == freezed
          ? _value.isVideoPlaying
          : isVideoPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      playbackEnded: playbackEnded == freezed
          ? _value.playbackEnded
          : playbackEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as PageController,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnboardingState implements _OnboardingState {
  const _$_OnboardingState(
      {this.isLoading = false,
      this.isVideoPlaying = false,
      this.playbackEnded = false,
      required this.controller,
      this.currentIndex = OnboardingState.kInitialPage});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isVideoPlaying;
  @JsonKey(defaultValue: false)
  @override
  final bool playbackEnded;
  @override
  final PageController controller;
  @JsonKey(defaultValue: OnboardingState.kInitialPage)
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'OnboardingState(isLoading: $isLoading, isVideoPlaying: $isVideoPlaying, playbackEnded: $playbackEnded, controller: $controller, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isVideoPlaying, isVideoPlaying) ||
                other.isVideoPlaying == isVideoPlaying) &&
            (identical(other.playbackEnded, playbackEnded) ||
                other.playbackEnded == playbackEnded) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isVideoPlaying,
      playbackEnded, controller, currentIndex);

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {bool isLoading,
      bool isVideoPlaying,
      bool playbackEnded,
      required PageController controller,
      int currentIndex}) = _$_OnboardingState;

  @override
  bool get isLoading;
  @override
  bool get isVideoPlaying;
  @override
  bool get playbackEnded;
  @override
  PageController get controller;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateCopyWith<_OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}
