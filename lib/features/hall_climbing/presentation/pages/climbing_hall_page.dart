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
    Key? key,
    required this.climbingHall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClimbingHallCubit>()..loadData(climbingHall),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton:
              BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () async {
                  final cubit = BlocProvider.of<ClimbingHallCubit>(context);
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
          ),
          body: BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 160,
                    stretch: true,
                    floating: true,
                    pinned: true,
                    snap: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          MyCachedNetworkImage(
                            imageUrl: climbingHall.image,
                            fit: BoxFit.cover,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: Offset.fromDirection(1))]),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: state.routes != null && state.routes!.isNotEmpty
                        ? SliverChildBuilderDelegate(
                            childCount: state.routes!.length,
                            (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 1,
                                      onPressed: (context) async {
                                        final climbingHallCubit =
                                            BlocProvider.of<ClimbingHallCubit>(
                                                context);

                                        final archivePermission =
                                            await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
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
                                                child: const Text('Отменить'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                child: const Text('Продолжить'),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (archivePermission == true) {
                                          climbingHallCubit.toArchive(
                                              hall: climbingHall,
                                              route: state.routes![index]);
                                        }
                                      },
                                      backgroundColor: Colors.red.shade400,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'arhivate',
                                    ),
                                  ],
                                ),
                                child: HallRouteWidget(
                                    climbingHall: climbingHall,
                                    route: state.routes![index]),
                              ),
                            ),
                          )
                        : SliverChildListDelegate([
                            const Center(
                                child: Text('Трасс еще нет, добавьте новую!'))
                          ]),
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
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

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
