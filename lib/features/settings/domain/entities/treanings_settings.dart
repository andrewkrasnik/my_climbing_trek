import 'package:equatable/equatable.dart';

class TreaningsSettings extends Equatable {
  final bool useGymTreanings;
  final bool useCardioTreanings;
  final bool useIceTreanings;
  final bool useStrengthTraining;
  final bool useRockTraining;
  final bool useMountaineering;
  final bool useTraveling;

  const TreaningsSettings({
    required this.useGymTreanings,
    required this.useCardioTreanings,
    required this.useIceTreanings,
    required this.useStrengthTraining,
    required this.useRockTraining,
    bool? useTraveling,
    bool? useMountaineering,
  })  : useMountaineering = useMountaineering ?? true,
        useTraveling = useTraveling ?? true;

  TreaningsSettings copyWith({
    bool? useGymTreanings,
    bool? useCardioTreanings,
    bool? useIceTreanings,
    bool? useStrengthTraining,
    bool? useRockTraining,
    bool? useMountaineering,
    bool? useTraveling,
  }) {
    return TreaningsSettings(
      useGymTreanings: useGymTreanings ?? this.useGymTreanings,
      useCardioTreanings: useCardioTreanings ?? this.useCardioTreanings,
      useIceTreanings: useIceTreanings ?? this.useIceTreanings,
      useStrengthTraining: useStrengthTraining ?? this.useStrengthTraining,
      useRockTraining: useRockTraining ?? this.useRockTraining,
      useMountaineering: useMountaineering ?? this.useMountaineering,
      useTraveling: useTraveling ?? this.useTraveling,
    );
  }

  factory TreaningsSettings.initial() => const TreaningsSettings(
        useGymTreanings: true,
        useCardioTreanings: true,
        useIceTreanings: true,
        useStrengthTraining: true,
        useRockTraining: true,
        useMountaineering: true,
        useTraveling: true,
      );

  @override
  List<Object?> get props => [
        useCardioTreanings,
        useGymTreanings,
        useIceTreanings,
        useRockTraining,
        useStrengthTraining,
        useMountaineering,
        useTraveling,
      ];
}
