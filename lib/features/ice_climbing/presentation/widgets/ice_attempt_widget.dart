import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempt_dialog.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:flutter/material.dart';

class IceAttemptWidget extends StatelessWidget {
  final IceTreaningAttempt attempt;
  final bool isCurrent;
  final CurrentIceTreaningCubit cubit;
  final String cacheKey;

  const IceAttemptWidget({
    required this.attempt,
    this.isCurrent = false,
    required this.cubit,
    super.key,
    required this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Row(children: [
          MyCachedNetworkImage(
            width: MediaQuery.of(context).size.width / 4,
            imageUrl: attempt.sector.image,
            cacheKey: cacheKey,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${attempt.sector.name}, ${attempt.wayLength} м. ${attempt.style.name}',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 8),
                  IceCategoryWidget(
                    category: isCurrent
                        ? attempt.sector.maxCategory
                        : attempt.category,
                    prefix: attempt.sector.icePrefix,
                  ),
                  const SizedBox(width: 24),
                  if (isCurrent)
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => IceAttemptDialog(
                            attempt: attempt,
                            cubit: cubit,
                            editing: true,
                          ),
                        );
                      },
                      child: const Text('Завершить'),
                    ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
