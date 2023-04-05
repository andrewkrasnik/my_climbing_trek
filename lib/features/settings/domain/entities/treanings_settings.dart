class TreaningsSettings {
  final bool useGymTreanings;
  final bool useCardioTreanings;
  final bool useIceTreanings;
  final bool useStrengthTraining;

  const TreaningsSettings({
    required this.useGymTreanings,
    required this.useCardioTreanings,
    required this.useIceTreanings,
    required this.useStrengthTraining,
  });

  TreaningsSettings copyWith({
    bool? useGymTreanings,
    bool? useCardioTreanings,
    bool? useIceTreanings,
    bool? useStrengthTraining,
  }) {
    return TreaningsSettings(
      useGymTreanings: useGymTreanings ?? this.useGymTreanings,
      useCardioTreanings: useCardioTreanings ?? this.useCardioTreanings,
      useIceTreanings: useIceTreanings ?? this.useIceTreanings,
      useStrengthTraining: useStrengthTraining ?? this.useStrengthTraining,
    );
  }

  factory TreaningsSettings.initial() => const TreaningsSettings(
        useGymTreanings: true,
        useCardioTreanings: true,
        useIceTreanings: true,
        useStrengthTraining: true,
      );
}
