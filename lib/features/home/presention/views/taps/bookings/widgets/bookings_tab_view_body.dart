import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/manger/bookings_tab_cubit.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/manger/bookings_tab_states.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/widgets/booking_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsTabViewBody extends StatelessWidget {
  const BookingsTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BookingsTabCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getBookings();
    });
    return CustomScrollView(
      slivers: [
        BlocBuilder<BookingsTabCubit, BookingsTabStates>(
          builder: (context, state) {
            if (state is BookingsTabCubitLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is BookingsTabCubitSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BookingInfoWidget(
                      booking: cubit.bookingsList[index],
                    );
                  },
                  childCount: cubit.bookingsList.length,
                ),
              );
            }
            if (state is BookingsTabCubitError) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.message)),
              );
            }
            return const SliverToBoxAdapter(child: Text('No Data'));
          },
        ),
      ],
    );
  }
}
