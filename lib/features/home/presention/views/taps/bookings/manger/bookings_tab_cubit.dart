import 'package:airbnb_clone_app/features/home/data/models/booking_model/booking_model.dart';
import 'package:airbnb_clone_app/features/home/data/repos/booking_tab_repo/bookings_tab_repo.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/manger/bookings_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingsTabCubit extends Cubit<BookingsTabStates> {
  BookingsTabCubit(this.bookingsTabRepo) : super(BookingsTabCubitInitial());
  final BookingsTabRepo bookingsTabRepo;

  List<BookingModel> bookingsList = [];

  Future<void> getBookings() async {
    emit(BookingsTabCubitLoading());
    var response = await bookingsTabRepo.fetchBooking();
    response.fold(
      (failure) {
        emit(BookingsTabCubitError(failure.message));
      },
      (bookings) {
        bookingsList.addAll(bookings);
        emit(BookingsTabCubitSuccess());
      },
    );
  }
}
