import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/contact_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/insurance_parameters_widget.dart';

class TravelInsuranceListWidget extends StatelessWidget {
  const TravelInsuranceListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelPageCubit, TravelPageState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TravelPageCubit>(context);

        return Column(
          children: [
            ...state.insurances.map((insurance) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlidableDataLineWidget(
                    onDelete: (context) {
                      cubit.deleteInsuranceLine(
                          travel: state.travel!, line: insurance);
                    },
                    onEdit: (context) {
                      showMyModalBottomSheet<void>(
                        context: context,
                        heightPersent: 0.8,
                        child: InsuranceParametersWidget(
                          cubit: cubit,
                          travel: state.travel!,
                          line: insurance,
                        ),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Полис № ',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              SelectableText(
                                insurance.number,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Страховая компания:'),
                              Text(insurance.insurer),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Застрахованное лицо:'),
                              Text(insurance.insurant),
                            ],
                          ),
                          if (insurance.description.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(insurance.description),
                          ],
                          ...insurance.contacts.map(
                            (contact) => SlidableDataLineWidget(
                              onDelete: (context) {
                                cubit.deleteContactForInsuranceLine(
                                    line: insurance,
                                    travel: state.travel!,
                                    contact: contact);
                              },
                              onEdit: (context) {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.8,
                                  child: ContactParametersWidget(
                                    line: contact,
                                    onTap: (
                                        {required data,
                                        required description,
                                        required id,
                                        required type}) {
                                      cubit.editContactForInsuranceLine(
                                        line: insurance,
                                        travel: state.travel!,
                                        contactData: data,
                                        contactType: type,
                                        contactDescription: description,
                                        contactId: id,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: ContactLineWidget(
                                contact: contact,
                              ),
                            ),
                          ),
                          OutlinedButton(
                              onPressed: () {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.6,
                                  child: ContactParametersWidget(
                                    onTap: (
                                        {required data,
                                        required description,
                                        required id,
                                        required type}) {
                                      cubit.editContactForInsuranceLine(
                                        line: insurance,
                                        travel: state.travel!,
                                        contactData: data,
                                        contactType: type,
                                        contactDescription: description,
                                        contactId: id,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Text('Добавить контакт')),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }
}
