class TreaningsSettings {
  final bool useGymTreanings;
  final bool useCardioTreanings;
  final bool useIceTreanings;
  final bool useStrengthTraining;
  final bool useRockTraining;

  const TreaningsSettings({
    required this.useGymTreanings,
    required this.useCardioTreanings,
    required this.useIceTreanings,
    required this.useStrengthTraining,
    required this.useRockTraining,
  });

  TreaningsSettings copyWith({
    bool? useGymTreanings,
    bool? useCardioTreanings,
    bool? useIceTreanings,
    bool? useStrengthTraining,
    bool? useRockTraining,
  }) {
    return TreaningsSettings(
      useGymTreanings: useGymTreanings ?? this.useGymTreanings,
      useCardioTreanings: useCardioTreanings ?? this.useCardioTreanings,
      useIceTreanings: useIceTreanings ?? this.useIceTreanings,
      useStrengthTraining: useStrengthTraining ?? this.useStrengthTraining,
      useRockTraining: useRockTraining ?? this.useRockTraining,
    );
  }

  factory TreaningsSettings.initial() => const TreaningsSettings(
        useGymTreanings: true,
        useCardioTreanings: true,
        useIceTreanings: true,
        useStrengthTraining: true,
        useRockTraining: true,
      );
}
