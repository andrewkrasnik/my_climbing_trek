import 'package:climbing_diary/core/extentions/date_time_extention.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_exercise.dart';
import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardioParametersWidget extends HookWidget {
  final CardioTreaning? treaning;

  const CardioParametersWidget({this.treaning, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exercise =
        useState<CardioExercise>(treaning?.exercise ?? CardioExercise.jogging);
    final lengthController =
        useTextEditingController(text: treaning?.length.toString());
    final durationController =
        useTextEditingController(text: treaning?.duration.toString());
    final date = useState<DateTime>(treaning?.date ?? DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      date.value = date.value.previosDay();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                InkWell(
                    onTap: () async {
                      final newDate = await showDatePicker(
                          context: context,
                          initialDate: date.value,
                          lastDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)));

                      if (newDate != null) {
                        date.value = newDate;
                      }
                    },
                    child: Text(
                      date.value.dayString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )),
                IconButton(
                    onPressed: () {
                      if (date.value
                          .toDayStart()
                          .isBefore(DateTime.now().toDayStart())) {
                        date.value = date.value.nextDay();
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: CardioExercise.values.map((exerc) {
                  final current = exerc == exercise.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: IconButton(
                        onPressed: () {
                          exercise.value = exerc;
                        },
                        color: current ? Colors.black : Colors.black38,
                        icon: Icon(
                          exerc.icon,
                          size: 40,
                        )),
                  );
                }).toList()),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Расстояние, ${exercise.value.lenghtUnit} ',
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Продолжительность, минут ',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CardioTreaningCubit>(context).save(
                    id: treaning?.id,
                    date: date.value,
                    duration: int.parse(durationController.text),
                    exercise: exercise.value,
                    length: double.parse(lengthController.text),
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}
