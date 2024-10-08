// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightImpl _$$FlightImplFromJson(Map<String, dynamic> json) => _$FlightImpl(
      airline: json['airline'] as String,
      departureCode: json['departureCode'] as String,
      departurePlace: json['departurePlace'] as String,
      arrivalCode: json['arrivalCode'] as String,
      arrivalPlace: json['arrivalPlace'] as String,
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrivalTime: DateTime.parse(json['arrivalTime'] as String),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      stops: (json['stops'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      isRefundable: json['isRefundable'] as bool? ?? false,
    );

Map<String, dynamic> _$$FlightImplToJson(_$FlightImpl instance) =>
    <String, dynamic>{
      'airline': instance.airline,
      'departureCode': instance.departureCode,
      'departurePlace': instance.departurePlace,
      'arrivalCode': instance.arrivalCode,
      'arrivalPlace': instance.arrivalPlace,
      'departureTime': instance.departureTime.toIso8601String(),
      'arrivalTime': instance.arrivalTime.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'stops': instance.stops,
      'price': instance.price,
      'currency': instance.currency,
      'isRefundable': instance.isRefundable,
    };

_$FlightOfferImpl _$$FlightOfferImplFromJson(Map<String, dynamic> json) =>
    _$FlightOfferImpl(
      onward: Flight.fromJson(json['onward'] as Map<String, dynamic>),
      return_: Flight.fromJson(json['return_'] as Map<String, dynamic>),
      isCheapest: json['isCheapest'] as bool? ?? false,
    );

Map<String, dynamic> _$$FlightOfferImplToJson(_$FlightOfferImpl instance) =>
    <String, dynamic>{
      'onward': instance.onward,
      'return_': instance.return_,
      'isCheapest': instance.isCheapest,
    };
