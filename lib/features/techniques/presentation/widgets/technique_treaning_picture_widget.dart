import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';

class TechniqueTreaningPictureWidget extends StatelessWidget {
  final TechniqueTreaning treaning;

  const TechniqueTreaningPictureWidget({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: treaning.itemsMap
              .map<TechniqueGroup, Widget>((group, value) => MapEntry(
                  group,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${group.name}:',
                        style: textStyle,
                      ),
                      Wrap(
                        children: [
                          ...value.map((tech) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Chip(
                                label: Text(
                                  tech.technique.name,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface),
                                ),
                              ))),
                        ],
                      ),
                    ],
                  )))
              .values
              .toList()),
    );
  }
}
