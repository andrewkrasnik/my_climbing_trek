import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_statistic.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart';

part 'travel_day_state.dart';
part 'travel_day_cubit.freezed.dart';

@Injectable()
class TravelDayCubit extends Cubit<TravelDayState> {
  final EditDayLineUsecase _editDayLineUsecase;

  TravelDayCubit(this._editDayLineUsecase) : super(TravelDayState.initial());

  void loadData({required TravelDay day}) {
    emit(
      TravelDayState(
        description: day.description,
        transportLines: day.transportLines,
        feedingsLines: day.feedingsLines,
        stayLines: day.stayLines,
        loading: false,
        errorMessage: '',
      ),
    );
  }

  Future<void> editTravelDay({String? description}) async {
    if (description != null) {
      emit(state.copyWith(description: description));
    }
  }

  Future<void> deleteTransportLine({
    TransportLine? line,
  }) async {
    emit(state.copyWith(loading: true));

    final List<TransportLine> lines = [...state.transportLines];

    lines.remove(line);

    emit(state.copyWith(transportLines: lines, loading: false));
  }

  Future<void> editTransportLine({
    TransportLine? line,
    required String description,
    required TransportType type,
    required TimeOfDay time,
    TimeOfDay? finishTime,
  }) async {
    emit(state.copyWith(loading: true));

    final newLine = TransportLine(
      type: type,
      name: '',
      description: description,
      time: time,
      finishTime: finishTime,
      contacts: line?.contacts ?? [],
    );

    final List<TransportLine> lines = [...state.transportLines];

    if (line != null) {
      lines.remove(line);
    }

    lines.add(newLine);

    emit(state.copyWith(transportLines: lines, loading: false));
  }

  Future<void> deleteStayLine({
    StayLine? line,
  }) async {
    emit(state.copyWith(loading: true));

    final List<StayLine> lines = [...state.stayLines];

    lines.remove(line);

    emit(state.copyWith(stayLines: lines, loading: false));
  }

  Future<void> editStayLine({
    StayLine? line,
    required String description,
    required StayType type,
    required TimeOfDay time,
  }) async {
    emit(state.copyWith(loading: true));

    final newLine = StayLine(
      type: type,
      name: '',
      description: description,
      time: time,
      contacts: line?.contacts ?? [],
    );

    final List<StayLine> lines = [...state.stayLines];

    if (line != null) {
      lines.remove(line);
    }

    lines.add(newLine);

    emit(state.copyWith(stayLines: lines, loading: false));
  }

  Future<void> editContactLine({
    required TravelDayLine line,
    ContactLine? contactLine,
    required String data,
    required ContactType type,
    required String description,
  }) async {
    emit(state.copyWith(loading: true));

    final newContact = ContactLine(
      type: type,
      data: data,
      description: description,
      id: contactLine?.id ?? '',
    );

    final newContacts = [...line.contacts];
    if (contactLine != null) {
      newContacts.remove(contactLine);
    }

    newContacts.add(newContact);

    _editContacts(newContacts: newContacts, line: line);
  }

  Future<void> deleteContactLine({
    required TravelDayLine line,
    required ContactLine contactLine,
  }) async {
    emit(state.copyWith(loading: true));

    final newContacts = [...line.contacts]..remove(contactLine);

    _editContacts(newContacts: newContacts, line: line);
  }

  void _editContacts({
    required List<ContactLine> newContacts,
    required TravelDayLine line,
  }) {
    if (line is TransportLine) {
      final newLine = TransportLine(
        type: line.type,
        name: line.name,
        description: line.description,
        time: line.time,
        finishTime: line.finishTime,
        contacts: newContacts,
      );

      final List<TransportLine> lines = [...state.transportLines]
        ..remove(line)
        ..add(newLine);

      emit(state.copyWith(transportLines: lines, loading: false));
    } else {
      line as StayLine;

      final newLine = StayLine(
        type: line.type,
        name: line.name,
        description: line.description,
        time: line.time,
        contacts: newContacts,
      );

      final List<StayLine> lines = [...state.stayLines]
        ..remove(line)
        ..add(newLine);

      emit(state.copyWith(stayLines: lines, loading: false));
    }
  }

  Future<void> editFeedingLine({
    required FeedingLine line,
    required FeedingType type,
  }) async {
    emit(state.copyWith(loading: true));

    final newLine = FeedingLine(meal: line.meal, type: type);

    final lines = [...state.feedingsLines];

    final index = lines.indexOf(line);

    lines[index] = newLine;

    emit(state.copyWith(feedingsLines: lines, loading: false));
  }

  Future<bool> saveTravelDay({required TravelDay day}) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _editDayLineUsecase(
      id: day.id,
      date: day.date,
      number: day.number,
      travelId: day.travelId,
      description: state.description,
      feedingsLines: state.feedingsLines,
      stayLines: state.stayLines,
      transportLines: state.transportLines,
      start: day.start,
    );

    return failureOrUnit.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.toString(), loading: false));
        return false;
      },
      (r) => true,
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}
