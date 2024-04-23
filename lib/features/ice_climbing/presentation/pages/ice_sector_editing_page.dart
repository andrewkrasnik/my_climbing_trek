import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/ice_types.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/core/widgets/select_category_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart';

class IceSectorEditingPage extends HookWidget {
  final IceDistrict district;
  final IceSector? sector;
  final IceSectorsCubit cubit;

  const IceSectorEditingPage({
    required this.district,
    this.sector,
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: sector?.id);

    final nameController = useTextEditingController(text: sector?.name);

    final descriptionController =
        useTextEditingController(text: sector?.description);

    final imageController = useTextEditingController(text: sector?.image);

    final categoryState =
        useState<IceCategory>(sector?.maxCategory ?? IceCategory.i3);

    final lengthController =
        useTextEditingController(text: sector?.length.toString());

    final icePrefixState =
        useState<IceType?>(IceTypes.byPrefix(sector?.icePrefix ?? ''));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(sector?.name ?? 'Новый сектор'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.saveSector(
                district: district,
                name: nameController.text,
                image: imageController.text,
                id: idController.text,
                waterfallIce: icePrefixState.value == IceTypes.waterfall,
                glacierIce: icePrefixState.value == IceTypes.glatcher,
                artificialIce: false,
                description: descriptionController.text,
                length: int.tryParse(lengthController.text) ?? 0,
                maxCategory: categoryState.value,
              );
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: idController,
                readOnly: sector != null,
                decoration: const InputDecoration(
                    labelText: 'ID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Название', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Ссылка на изображение',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: lengthController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: const InputDecoration(
                    labelText: 'Длина участка, м.',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text('Вид льда:'),
              ChipSelectedWidget<IceType>(
                values: IceTypes.values,
                state: icePrefixState,
              ),
              const SizedBox(height: 16),
              const Text('Максимальная категория сложности:'),
              SelectCategoryWidget<IceCategory>(
                categoryState: categoryState,
                values: IceCategory.values,
              ),
              const SizedBox(height: 16),
              TextFormField(
                minLines: 1,
                maxLines: 20,
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Описание', border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
