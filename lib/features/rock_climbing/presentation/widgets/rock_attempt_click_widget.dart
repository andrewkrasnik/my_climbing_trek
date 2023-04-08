import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/attempt_budget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_dialog.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';

class RockAttemptClickWidget extends StatelessWidget {
  final RockTreaningAttempt attempt;
  const RockAttemptClickWidget({
    required this.attempt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget topRight;

    if (attempt.fail == true) {
      topRight = const AttemptBudget(
          color: Colors.red,
          child: Icon(
            Icons.close,
            size: 12,
            color: Colors.white,
          ));
    } else {
      topRight = const SizedBox();
    }

    const badgetTextStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

    final Widget bottomRight = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (attempt.fallCount > 0)
          AttemptBudget(
            color: Colors.red,
            child: Text(
              attempt.fallCount.toString(),
              textAlign: TextAlign.center,
              style: badgetTextStyle,
            ),
          ),
        if (attempt.suspensionCount > 0)
          AttemptBudget(
            color: Colors.orange,
            child: Text(
              attempt.suspensionCount.toString(),
              textAlign: TextAlign.center,
              style: badgetTextStyle,
            ),
          ),
      ],
    );

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => RockAttemptDialog(
          attempt: attempt,
          cubit: BlocProvider.of<RockTreaningCubit>(context),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          RockCategoryWidget(
            category: attempt.category,
          ),
          if (attempt.route?.number != null)
            Positioned(
              bottom: 3,
              child: Text(
                attempt.route!.number.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Positioned(right: 0, top: 0, child: topRight),
          Positioned(
            right: 0,
            bottom: 0,
            child: bottomRight,
          )
        ],
      ),
    );
  }
}
