import 'package:airbnb_clone_app/features/home/presention/views/taps/users/manger/cubit/users_tab_cubit.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/users/widgets/user_tab_view_body.dart';
import 'package:airbnb_clone_app/injectables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersTabView extends StatelessWidget {
  const UsersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersTabCubit>(
      create: (context) => getIt<UsersTabCubit>(),
      child: Scaffold(
        body: UsersTabViewBody(),
      ),
    );
  }
}
