part of 'blog_cubit.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState.initial() = _Initial;
  const factory BlogState.loading() = _Loading;
  const factory BlogState.data({
    required List<Publication> publications,
    PublicationFilter? filter,
  }) = _Data;
  const factory BlogState.error({required String description}) = _Error;
}
