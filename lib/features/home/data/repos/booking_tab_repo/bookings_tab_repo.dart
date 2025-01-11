import 'package:airbnb_clone_app/core/errors/failure.dart';
import 'package:airbnb_clone_app/features/home/data/models/booking_model/booking_model/booking_model.dart';
import 'package:dartz/dartz.dart';

abstract class BookingsTabRepo {
  Future<Either<Failure, List<BookingModel>>> fetchBooking();
}
