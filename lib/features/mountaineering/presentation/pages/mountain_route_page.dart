import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_editing_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_roop_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MountainRoutePage extends StatelessWidget {
  final Mountain mountain;
  final MountainRoute route;

  const MountainRoutePage(
      {required this.route, required this.mountain, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(route.name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MountainRouteEditingPage(
                    route: route,
                    mountain: mountain,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      floatingActionButton: BlocBuilder<AscensionCubit, AscensionState>(
        builder: (context, state) {
          return state.ascension == null
              ? FloatingActionButton(
                  child: const Icon(
                    Icons.hiking,
                    size: 40,
                  ),
                  onPressed: () {
                    BlocProvider.of<AscensionCubit>(context)
                        .addAscension(mountain: mountain, route: route);

                    Navigator.of(context).popUntil((route) => route.isFirst);
                  })
              : const SizedBox();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (route.image?.isNotEmpty == true)
                ScaledImageWidget(imageUrl: route.image!),
              if (route.ueaaSchemaImage?.isNotEmpty == true) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(child: Text('Схема UEAA:')),
                ),
                ScaledImageWidget(imageUrl: route.ueaaSchemaImage!),
              ],
              if (route.description.isNotEmpty) ...[
                Text(route.description),
                const SizedBox(height: 4),
              ],
              if (route.passage.isNotEmpty) ...[
                const Text(
                  'Подход:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(route.passage),
                const SizedBox(height: 4),
              ],
              ...route.roops.map((roop) => MountainRoopWidget(roop: roop)),
              if (route.descent.isNotEmpty) ...[
                const SizedBox(height: 4),
                const Text(
                  'Спуск:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(route.descent),
              ],
              if (route.farLink?.isNotEmpty == true) ...[
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    launchUrlString(route.farLink!,
                        mode: LaunchMode.externalApplication);
                  },
                  child: const Text(
                    'В базе ФАР',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              if (route.links.isNotEmpty) ...[
                const SizedBox(height: 8),
                const Text(
                  'Сслыки по теме:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...route.links.map((link) => InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(link),
                      ),
                      onTap: () {
                        launchUrlString(link,
                            mode: LaunchMode.externalApplication);
                      },
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
