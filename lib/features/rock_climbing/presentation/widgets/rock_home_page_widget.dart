import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_district_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_districts_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_district_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockHomePageWidget extends StatelessWidget {
  const RockHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(children: [
      const Text(
        'Тренировки на скалах',
        style: titleTextStyle,
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Скалолазные районы:'),
          TextButton(
            child: const Text('Смотреть все'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RockDistrictsPage())),
          ),
        ],
      ),
      BlocProvider(
        create: (context) => getIt<RockDistrictsCubit>()..loadData(),
        child: SizedBox(
          height: 120,
          child: BlocBuilder<RockDistrictsCubit, RockDistrictsState>(
            builder: (context, state) {
              // final cubit =
              //     BlocProvider.of<CurrentIceTreaningCubit>(context);
              return state.maybeMap(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                data: (dataState) => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            RockDistrictWidget(
                              district: dataState.districts[index],
                              onTap: () {
                                final bool showAddButton = false;
                                // final district = dataState.districts[index];
                                // final bool showAddButton =
                                //     cubit.state.currentTreaning == null ||
                                //         cubit.state.currentTreaning?.district ==
                                //             district;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RockDistrictPage(
                                        // addSector: showAddButton
                                        //     ? (sector) {
                                        //         cubit.addIceSectorToTreaning(
                                        //             sector: sector,
                                        //             district: district);
                                        //       }
                                        //     : null,
                                        district: dataState.districts[index])));
                              },
                            ),
                            // BlocBuilder<CurrentIceTreaningCubit,
                            //     CurrentIceTreaningState>(
                            //   builder: (context, state) {
                            //     final cubit =
                            //         BlocProvider.of<CurrentIceTreaningCubit>(
                            //             context);
                            //     return state.currentTreaning == null &&
                            //             dataState.districts[index].compact
                            //         ? Align(
                            //             alignment: Alignment.bottomRight,
                            //             child: IconButton(
                            //               icon: const Icon(Icons.add_box,
                            //                   color: Colors.white),
                            //               onPressed: () {
                            //                 cubit.addNewTreaning(
                            //                   district:
                            //                       dataState.districts[index],
                            //                 );
                            //               },
                            //             ),
                            //           )
                            //         : const SizedBox();
                            //   },
                            // )
                          ],
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: 16,
                        ),
                    itemCount: dataState.districts.length),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    ]);
  }
}
