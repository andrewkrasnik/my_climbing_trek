import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_events_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_title_widget.dart';

class AscensionPage extends StatelessWidget {
  final Ascension ascension;

  const AscensionPage({
    required this.ascension,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 260,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: MyCachedNetworkImage(
                  imageUrl: ascension.mountain.image,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: AscensionTitleWidget(ascension: ascension),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    AscensionEventsWidget(ascension: ascension),
                  ]),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
