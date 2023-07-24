import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';

class TravelDay extends Treaning {
  final int number;
  String description;
  List<TransportLine> transportLines;
  List<FeedingLine> feedingsLines;
  List<StayLine> stayLines;

  TravelDay({
    required super.date,
    required this.number,
    this.description = '',
    super.id,
    super.start,
    List<TransportLine>? transportLines,
    List<FeedingLine>? feedingsLines,
    List<StayLine>? stayLines,
  })  : transportLines = transportLines ?? [],
        feedingsLines = feedingsLines ??
            [
              FeedingLine(meal: Meal.breakfast, type: FeedingType.none),
              FeedingLine(meal: Meal.lunch, type: FeedingType.none),
              FeedingLine(meal: Meal.dinner, type: FeedingType.none),
            ],
        stayLines = stayLines ?? [] {
    if (number == 1) {
      this.transportLines.add(
            TransportLine(
              type: TransportType.airplane,
              date: date,
              description: 'Рейс 234 213',
              name: 'Москва-Бишкек',
            ),
          );

      this.transportLines.add(
            TransportLine(
                type: TransportType.taxi,
                date: date,
                description: 'через яндекс такси',
                name: 'Трансфер до офиса',
                contacts: [
                  ContactLine(
                    type: ContactType.phone,
                    data: '+7 495 999 99 99',
                  ),
                  ContactLine(
                    type: ContactType.address,
                    data: '720005, г.Бишкек ул. Ибраимова, 113/2',
                  ),
                ]),
          );

      this.stayLines.add(StayLine(
              type: StayType.sleep,
              name: 'Гостевой дом',
              description: 'Бронирование 123',
              date: date,
              contacts: [
                ContactLine(
                  type: ContactType.address,
                  data: '720005, г.Бишкек ул. Ибраимова, 113/2',
                )
              ]));
    }
  }
}
