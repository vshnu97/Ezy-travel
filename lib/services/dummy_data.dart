import 'package:ezy_travel/model/flight_model.dart';

final dummyOffers = [
  FlightOffer(
    onward: Flight(
      airline: 'Emirates',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 2, 1, 9, 30),
      arrivalTime: DateTime(2024, 2, 1, 12, 45),
      duration: const Duration(hours: 4, minutes: 15),
      stops: 0,
      price: 499,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Emirates',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 2, 8, 15, 45),
      arrivalTime: DateTime(2024, 2, 8, 20, 0),
      duration: const Duration(hours: 4, minutes: 15),
      stops: 0,
      price: 459,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: true,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Air India',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 1, 5, 11, 0),
      arrivalTime: DateTime(2024, 1, 5, 16, 0),
      duration: const Duration(hours: 5, minutes: 0),
      stops: 1,
      price: 399,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Air India',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 1, 12, 10, 15),
      arrivalTime: DateTime(2024, 1, 12, 15, 30),
      duration: const Duration(hours: 5, minutes: 15),
      stops: 1,
      price: 349,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: true,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Qatar Airways',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 3, 10, 22, 0),
      arrivalTime: DateTime(2024, 3, 11, 2, 45),
      duration: const Duration(hours: 4, minutes: 45),
      stops: 1,
      price: 559,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Qatar Airways',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 3, 17, 20, 30),
      arrivalTime: DateTime(2024, 3, 18, 1, 10),
      duration: const Duration(hours: 4, minutes: 40),
      stops: 1,
      price: 499,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'SpiceJet',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 2, 15, 6, 0),
      arrivalTime: DateTime(2024, 2, 15, 10, 30),
      duration: const Duration(hours: 4, minutes: 30),
      stops: 0,
      price: 349,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'SpiceJet',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 2, 22, 17, 15),
      arrivalTime: DateTime(2024, 2, 22, 22, 30),
      duration: const Duration(hours: 4, minutes: 15),
      stops: 0,
      price: 329,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: true,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'IndiGo',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 4, 1, 23, 50),
      arrivalTime: DateTime(2024, 4, 2, 4, 25),
      duration: const Duration(hours: 4, minutes: 35),
      stops: 0,
      price: 379,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'IndiGo',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 4, 8, 6, 15),
      arrivalTime: DateTime(2024, 4, 8, 11, 0),
      duration: const Duration(hours: 4, minutes: 45),
      stops: 0,
      price: 339,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Oman Air',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 5, 3, 20, 15),
      arrivalTime: DateTime(2024, 5, 4, 2, 10),
      duration: const Duration(hours: 5, minutes: 55),
      stops: 1,
      price: 499,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Oman Air',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 5, 10, 8, 0),
      arrivalTime: DateTime(2024, 5, 10, 13, 15),
      duration: const Duration(hours: 5, minutes: 15),
      stops: 1,
      price: 449,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Flydubai',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 6, 7, 18, 25),
      arrivalTime: DateTime(2024, 6, 7, 22, 55),
      duration: const Duration(hours: 4, minutes: 30),
      stops: 0,
      price: 389,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Flydubai',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 6, 14, 16, 40),
      arrivalTime: DateTime(2024, 6, 14, 21, 0),
      duration: const Duration(hours: 4, minutes: 20),
      stops: 0,
      price: 349,
      currency: 'AED',
      isRefundable: false,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: true,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'SriLankan Airlines',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 7, 12, 2, 45),
      arrivalTime: DateTime(2024, 7, 12, 9, 0),
      duration: const Duration(hours: 6, minutes: 15),
      stops: 1,
      price: 549,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'SriLankan Airlines',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 7, 19, 19, 30),
      arrivalTime: DateTime(2024, 7, 20, 2, 0),
      duration: const Duration(hours: 6, minutes: 30),
      stops: 1,
      price: 499,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Etihad Airways',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 8, 20, 16, 10),
      arrivalTime: DateTime(2024, 8, 20, 20, 35),
      duration: const Duration(hours: 4, minutes: 25),
      stops: 1,
      price: 469,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Etihad Airways',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 8, 27, 17, 0),
      arrivalTime: DateTime(2024, 8, 27, 21, 40),
      duration: const Duration(hours: 4, minutes: 40),
      stops: 1,
      price: 429,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
  FlightOffer(
    onward: Flight(
      airline: 'Vistara',
      departureCode: 'BLR',
      arrivalCode: 'DXB',
      departureTime: DateTime(2024, 9, 5, 7, 20),
      arrivalTime: DateTime(2024, 9, 5, 12, 50),
      duration: const Duration(hours: 5, minutes: 30),
      stops: 1,
      price: 389,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Bengaluru',
      arrivalPlace: 'Dubai',
    ),
    return_: Flight(
      airline: 'Vistara',
      departureCode: 'DXB',
      arrivalCode: 'BLR',
      departureTime: DateTime(2024, 9, 12, 10, 0),
      arrivalTime: DateTime(2024, 9, 12, 15, 20),
      duration: const Duration(hours: 5, minutes: 20),
      stops: 1,
      price: 349,
      currency: 'AED',
      isRefundable: true,
      departurePlace: 'Dubai',
      arrivalPlace: 'Bengaluru',
    ),
    isCheapest: false,
  ),
];