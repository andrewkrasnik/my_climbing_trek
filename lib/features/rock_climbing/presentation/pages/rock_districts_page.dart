import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_district_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_district_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RockDistrictsPage extends StatelessWidget {
  const RockDistrictsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Скалолазные районы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => getIt<RockDistrictsCubit>()..loadData(),
          child: BlocBuilder<RockDistrictsCubit, RockDistrictsState>(
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.districts.length,
                        itemBuilder: (context, index) {
                          final district = dataState.districts[index];
                          return RockDistrictWidget(
                            district: district,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RockDistrictPage(district: district))),
                            height: 220,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                  orElse: () => const SizedBox());
            },
          ),
        ),
      ),
    );
  }
}
