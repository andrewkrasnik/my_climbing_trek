import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/hall_route_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_roure_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../bloc/climbing_hall/climbing_hall_cubit.dart';

class ClimbingHallPage extends StatelessWidget {
  final ClimbingHall climbingHall;
  const ClimbingHallPage({
    super.key,
    required this.climbingHall,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClimbingHallCubit>()..loadData(climbingHall),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: climbingHall.hasEditPermission
              ? BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      onPressed: () async {
                        final cubit =
                            BlocProvider.of<ClimbingHallCubit>(context);
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HallRoutePage(
                                  climbingHall: climbingHall,
                                )));

                        cubit.loadData(climbingHall);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    );
                  },
                )
              : null,
          body: BlocConsumer<ClimbingHallCubit, ClimbingHallState>(
            listenWhen: (_, current) =>
                current.maybeMap(error: (_) => true, orElse: () => false),
            listener: (context, state) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Ошибка'),
                  content: Column(
                    children: [
                      Text(
                        state.maybeMap(
                            error: (errorState) => errorState.description,
                            orElse: () => 'Неизвестная ошибка'),
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            },
            buildWhen: (_, current) =>
                current.maybeMap(error: (_) => false, orElse: () => true),
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    stretch: true,
                    floating: true,
                    pinned: true,
                    snap: false,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(
                          bottom: 16, left: 16, right: 16),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Hero(
                            tag: 'gym${climbingHall.id}',
                            child: MyCachedNetworkImage(
                              imageUrl: climbingHall.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ContactsTextWidget(
                                  title: climbingHall.fullAddress,
                                  icon: Icons.home,
                                  onTap: () => launchUrlString(
                                      'https://yandex.ru/maps/?text=${climbingHall.fullAddress}'),
                                ),
                                ContactsTextWidget(
                                  title: climbingHall.website,
                                  icon: Icons.language,
                                  onTap: () =>
                                      launchUrlString(climbingHall.website),
                                ),
                                ContactsTextWidget(
                                  title: climbingHall.telephone,
                                  icon: Icons.call,
                                  onTap: () => launchUrlString(
                                      'tel:${climbingHall.telephone}'),
                                ),
                                ContactsTextWidget(
                                  title: climbingHall.email,
                                  icon: Icons.email,
                                  onTap: () => launchUrlString(
                                    'mailto:${climbingHall.email}',
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      centerTitle: true,
                      title: Text(
                        climbingHall.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: Offset.fromDirection(1))]),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: state.maybeMap(
                        initial: (_) => SliverChildListDelegate([
                              const Center(
                                  child: Text('Трасс еще нет, добавьте новую!'))
                            ]),
                        loading: (_) => SliverChildListDelegate(
                            [const Center(child: CircularProgressIndicator())]),
                        data: (dataState) => SliverChildBuilderDelegate(
                              childCount: dataState.routes.length,
                              (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Slidable(
                                  endActionPane: climbingHall.hasEditPermission
                                      ? ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              onPressed: (context) async {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            HallRoutePage(
                                                              climbingHall:
                                                                  climbingHall,
                                                              route: dataState
                                                                      .routes[
                                                                  index],
                                                            )));
                                              },
                                              backgroundColor:
                                                  Colors.orange.shade400,
                                              foregroundColor: Colors.white,
                                              icon: Icons.edit,
                                              label: 'edit',
                                            ),
                                            SlidableAction(
                                              flex: 1,
                                              onPressed: (context) async {
                                                final climbingHallCubit =
                                                    BlocProvider.of<
                                                            ClimbingHallCubit>(
                                                        context);

                                                final archivePermission =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        'Подтверждение архивирования'),
                                                    content: const Text(
                                                        'Трассу скрутили и она больше недоступна?'),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(false);
                                                        },
                                                        child: const Text(
                                                            'Отменить'),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(true);
                                                        },
                                                        child: const Text(
                                                            'Продолжить'),
                                                      ),
                                                    ],
                                                  ),
                                                );

                                                if (archivePermission == true) {
                                                  climbingHallCubit.toArchive(
                                                      hall: climbingHall,
                                                      route: dataState
                                                          .routes[index]);
                                                }
                                              },
                                              backgroundColor:
                                                  Colors.red.shade400,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'arhivate',
                                            ),
                                          ],
                                        )
                                      : null,
                                  child: HallRouteWidget(
                                    climbingHall: climbingHall,
                                    route: dataState.routes[index],
                                    loadStatistic: dataState.statistic == null,
                                    statistic: dataState
                                        .statistic?[dataState.routes[index]],
                                  ),
                                ),
                              ),
                            ),
                        orElse: () => SliverChildListDelegate([
                              const SizedBox(),
                            ])),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ContactsTextWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const ContactsTextWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final contactsTextStyle = TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(offset: Offset.fromDirection(1))]);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 16,
              shadows: [Shadow(offset: Offset.fromDirection(1))],
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: contactsTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
