import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/data/drytooling_category.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/core/widgets/select_category_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';

class RockRouteParametersWidget extends HookWidget {
  final RockRoute? route;
  const RockRouteParametersWidget({this.route, super.key});

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: route?.id);

    final categoryState = useState<DifficultyCategory?>(route?.category);

    final typeState = useState<ClimbingRouteType?>(route?.type);

    final authorController = useTextEditingController(text: route?.author);

    final nameController = useTextEditingController(text: route?.name);

    final lengthController =
        useTextEditingController(text: route?.length.toString());

    final boltCountController =
        useTextEditingController(text: route?.boltCount.toString());

    final numberController =
        useTextEditingController(text: route?.number.toString());

    final anchorController = useTextEditingController(text: route?.anchor);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextFormField(
              controller: idController,
              readOnly: route != null,
              decoration: const InputDecoration(
                  labelText: 'ID', border: OutlineInputBorder()),
            ),
            ChipSelectedWidget<ClimbingRouteType>(
              values: ClimbingRouteType.rockValues,
              state: typeState,
            ),
            if (typeState.value != ClimbingRouteType.dryTooling)
              SelectCategoryWidget<DifficultyCategory>(
                categoryState: categoryState,
                values: ClimbingCategory.rockValues,
              ),
            if (typeState.value == ClimbingRouteType.dryTooling)
              SelectCategoryWidget<DifficultyCategory>(
                categoryState: categoryState,
                values: DrytoolingCategory.values,
              ),
            const SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: 'Название', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: authorController,
              decoration: const InputDecoration(
                  labelText: 'Автор', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: numberController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: const InputDecoration(
                  labelText: 'Номер дорожки', border: OutlineInputBorder()),
            ),
            if (typeState.value != ClimbingRouteType.bouldering) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: lengthController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: const InputDecoration(
                    labelText: 'Длина дорожки, м.',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: boltCountController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: const InputDecoration(
                    labelText: 'Количество шлямбуров',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: anchorController,
                decoration: const InputDecoration(
                    labelText: 'Станция', border: OutlineInputBorder()),
              ),
            ],
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}
