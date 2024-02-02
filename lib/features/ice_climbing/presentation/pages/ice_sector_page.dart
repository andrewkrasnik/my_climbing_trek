import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/text_with_title_widget.dart';
import 'package:flutter/material.dart';

class IceSectorPage extends StatelessWidget {
  final IceDistrict district;
  final IceSector sector;
  const IceSectorPage({
    required this.sector,
    required this.district,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            MySliverAppBarWidget(
              heroTag: 'icesector${sector.id}',
              title: sector.name,
              imageUrl: sector.image,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                TextWithTitleWidget(
                  title: 'Вид льда:',
                  child: Text(sector.iceType),
                ),
                TextWithTitleWidget(
                  title: 'Протяженность, м:',
                  child: Text(sector.length.toString()),
                ),
                TextWithTitleWidget(
                  title: 'Максимальная сложность:',
                  child: Text(sector.maxCategory.name),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(sector.description),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
