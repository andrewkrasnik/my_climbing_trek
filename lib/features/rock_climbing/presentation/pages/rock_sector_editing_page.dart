import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/chip_selector_widget.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_route_parameters_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_route_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockSectorEditingPage extends HookWidget {
  final RockDistrict district;
  final RockSector? sector;

  const RockSectorEditingPage({required this.district, this.sector, super.key});

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: sector?.id);

    final nameController = useTextEditingController(text: sector?.name);

    final imageController = useTextEditingController(text: sector?.image);

    final hasRopeState = useState<bool>(sector?.hasRope ?? false);

    final hasBoulderingState = useState<bool>(sector?.hasBouldering ?? false);

    final hasAidState = useState<bool>(sector?.hasAid ?? false);

    final hasDryToolingState = useState<bool>(sector?.hasDryTooling ?? false);

    final hasTradState = useState<bool>(sector?.hasTrad ?? false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(sector?.name ?? 'Новый сектор'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyModalBottomSheet<void>(
            context: context,
            heightPersent: 0.9,
            child: const RockRouteParametersWidget(),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: idController,
                readOnly: sector != null,
                decoration: const InputDecoration(
                    labelText: 'ID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Название', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Ссылка на изображение',
                    border: OutlineInputBorder()),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  ChipSelectorWidget(
                    name: 'Трудность',
                    state: hasRopeState,
                  ),
                  ChipSelectorWidget(
                    name: 'Болдеринг',
                    state: hasBoulderingState,
                  ),
                  ChipSelectorWidget(
                    name: 'Трэд',
                    state: hasTradState,
                  ),
                  ChipSelectorWidget(
                    name: 'Драйтулинг',
                    state: hasDryToolingState,
                  ),
                  ChipSelectorWidget(
                    name: 'ИТО',
                    state: hasAidState,
                  ),
                ],
              ),
              if (sector != null)
                BlocProvider(
                  create: (context) => getIt<RockRoutesCubit>(),
                  child: Builder(
                    builder: (context) {
                      BlocProvider.of<RockRoutesCubit>(context).loadData(
                        district: district,
                        sector: sector!,
                      );
                      return BlocBuilder<RockRoutesCubit, RockRoutesState>(
                        builder: (context, state) {
                          return state.maybeMap(
                            data: (dataState) {
                              return Column(
                                children: dataState.routes
                                    .map((route) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4),
                                          child: SlidableDataLineWidget(
                                            delete: true,
                                            edit: true,
                                            onDelete: (_) {},
                                            onEdit: (_) {
                                              showMyModalBottomSheet<void>(
                                                context: context,
                                                heightPersent: 0.9,
                                                child:
                                                    RockRouteParametersWidget(
                                                        route: route),
                                              );
                                            },
                                            child: RockRouteWidget(
                                              route: route,
                                              statistic:
                                                  dataState.statistic?[route],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              );
                            },
                            loading: (_) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            orElse: () => const SizedBox(),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
