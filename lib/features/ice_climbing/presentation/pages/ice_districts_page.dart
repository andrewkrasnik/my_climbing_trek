import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_district_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_district_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IceDistrictsPage extends StatelessWidget {
  const IceDistrictsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ледолазные районы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => getIt<IceDistrictsCubit>()..loadData(),
          child: BlocBuilder<IceDistrictsCubit, IceDistrictsState>(
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.districts.length,
                        itemBuilder: (context, index) {
                          final district = dataState.districts[index];
                          return IceDistrictWidget(
                            district: district,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        IceDistrictPage(district: district))),
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
