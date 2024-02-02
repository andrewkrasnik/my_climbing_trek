import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/blog/presentation/bloc/blog_cubit.dart';
import 'package:my_climbing_trek/features/blog/presentation/pages/publication_page.dart';
import 'package:my_climbing_trek/features/blog/presentation/widgets/publication_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BlogCubit>()..loadData(),
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<BlogCubit, BlogState>(
              builder: (context, state) {
                return state.maybeMap(
                  data: (dataState) => ListView.separated(
                    itemCount: dataState.publications.length,
                    itemBuilder: (context, index) => PublicationWidget(
                      publication: dataState.publications[index],
                      height: 200,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PublicationPage(
                                    publication: dataState.publications[index],
                                  )),
                        );
                      },
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 16,
                    ),
                  ),
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            )),
      ),
    );
  }
}
