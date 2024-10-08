import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_model.freezed.dart';
part 'flight_model.g.dart';

@freezed
class Flight with _$Flight {
  factory Flight({
    required String airline,
    required String departureCode,
    required String departurePlace,
    required String arrivalCode,
    required String arrivalPlace,
    required DateTime departureTime,
    required DateTime arrivalTime,
    required Duration duration,
    required int stops,
    required double price,
    required String currency,
    @Default(false) bool isRefundable,
  }) = _Flight;

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
}

@freezed
class FlightOffer with _$FlightOffer {
  factory FlightOffer({
    required Flight onward,
    required Flight return_,
    @Default(false) bool isCheapest,
  }) = _FlightOffer;

  factory FlightOffer.fromJson(Map<String, dynamic> json) =>
      _$FlightOfferFromJson(json);
}
