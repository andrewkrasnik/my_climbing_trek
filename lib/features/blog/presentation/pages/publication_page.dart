import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';

class PublicationPage extends StatelessWidget {
  final Publication publication;
  const PublicationPage({required this.publication, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            MySliverAppBarWidget(
              heroTag: 'publication',
              title: publication.title,
              imageUrl: publication.titleImage,
            ),
            SliverList(
              delegate: SliverChildListDelegate([]),
            ),
          ],
        ),
      ),
    );
  }
}
