import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/hall_route_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_roure_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Scaffold(
        floatingActionButton: BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 160,
              stretch: true,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      climbingHall.image,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
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
                            onTap: () => launchUrlString(climbingHall.website),
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
                titlePadding: const EdgeInsets.only(bottom: 120),
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
              delegate: SliverChildListDelegate(
                [
                  BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
                    builder: (context, state) {
                      if (state.routes != null) {
                        return ListView.separated(
                            padding: const EdgeInsets.all(16),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Center(
                                child: HallRouteWidget(
                                    route: state.routes![index])),
                            separatorBuilder: (_, __) => const SizedBox(
                                  height: 8,
                                ),
                            itemCount: state.routes!.length);
                      } else {
                        return const Center(
                            child: Text('Пока нет трасс, добавьте новую!'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
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
