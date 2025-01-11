import 'package:airbnb_clone_app/core/errors/failure.dart';
import 'package:airbnb_clone_app/core/utils/api_constants.dart';
import 'package:airbnb_clone_app/core/utils/api_service.dart';
import 'package:airbnb_clone_app/features/home/data/models/booking_model/booking_model/booking_model.dart';
import 'package:airbnb_clone_app/features/home/data/repos/booking_tab_repo/bookings_tab_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BookingsTabRepo)
class BookingsTabRepoImpl extends BookingsTabRepo {
  final ApiService apiService;
  BookingsTabRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookingModel>>> fetchBooking() async {
    try {
      var response = await apiService.get('$baseUrl$bookingsEndpoint');
      List<BookingModel> bookings = [];
      for (var booking in response.data) {
        bookings.add(BookingModel.fromJson(booking));
      }
      return Right(bookings);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
