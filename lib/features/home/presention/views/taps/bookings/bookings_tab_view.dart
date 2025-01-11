import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/manger/bookings_tab_cubit.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/bookings/widgets/bookings_tab_view_body.dart';
import 'package:airbnb_clone_app/injectables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsTabView extends StatelessWidget {
  const BookingsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookingsTabCubit>(),
      child: Scaffold(
        body: BookingsTabViewBody(),
      ),
    );
  }
}
