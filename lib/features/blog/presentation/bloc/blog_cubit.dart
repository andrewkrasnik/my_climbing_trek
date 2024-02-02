import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publications_filter.dart';
import 'package:my_climbing_trek/features/blog/domain/usecases/get_publications.dart';

part 'blog_state.dart';
part 'blog_cubit.freezed.dart';

@Injectable()
class BlogCubit extends Cubit<BlogState> {
  final GetPublications _getPublications;
  BlogCubit(this._getPublications) : super(const BlogState.initial());

  Future<void> loadData() async {
    emit(const BlogState.loading());

    final failureOrTreanings = await _getPublications();

    failureOrTreanings.fold(
        (failure) => emit(BlogState.error(
              description: failure.toString(),
            )), (stream) {
      stream.listen((event) => event.fold(
              (failure) => emit(BlogState.error(
                    description: failure.toString(),
                  )), (publications) {
            emit(const BlogState.loading());
            emit(
              BlogState.data(publications: publications),
            );
          }));
    });
  }
}
