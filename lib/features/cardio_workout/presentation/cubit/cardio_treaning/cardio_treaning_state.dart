part of 'cardio_treaning_cubit.dart';

class CardioTreaningState extends Equatable {
  final CardioTreaning? lastTreaning;
  final bool loading;
  final String errorMessage;

  const CardioTreaningState({
    this.lastTreaning,
    required this.loading,
    this.errorMessage = '',
  });

  factory CardioTreaningState.initial() =>
      const CardioTreaningState(loading: false);

  @override
  List<Object> get props => [lastTreaning ?? '', loading];

  CardioTreaningState copyWith({
    CardioTreaning? lastTreaning,
    bool? loading,
    String? errorMessage,
  }) {
    return CardioTreaningState(
      lastTreaning: lastTreaning ?? this.lastTreaning,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
