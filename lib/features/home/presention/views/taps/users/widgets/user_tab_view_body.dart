import 'package:airbnb_clone_app/features/home/presention/views/taps/users/manger/cubit/users_tab_cubit.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/users/widgets/user_info_card.dart';
import 'package:airbnb_clone_app/features/home/presention/views/taps/users/widgets/users_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersTabViewBody extends StatelessWidget {
  const UsersTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UsersTabCubit>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.getUsers();
    });
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<UsersTabCubit, UsersTabCubitState>(
                  builder: (context, state) {
                    return UserTypeWidget(
                      userType: 'Admins',
                      isActive: cubit.isAdminsActive,
                      onTap: () {
                        cubit.changeAdminActive();
                      },
                    );
                  },
                ),
                BlocBuilder<UsersTabCubit, UsersTabCubitState>(
                  builder: (context, state) {
                    return UserTypeWidget(
                      userType: 'Owners',
                      isActive: cubit.isOwnersActive,
                      onTap: () {
                        cubit.changeOwnerActive();
                      },
                    );
                  },
                ),
                BlocBuilder<UsersTabCubit, UsersTabCubitState>(
                  builder: (context, state) {
                    return UserTypeWidget(
                      userType: 'Clients',
                      isActive: cubit.isClientsActive,
                      onTap: () {
                        cubit.changeClientActive();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        BlocBuilder<UsersTabCubit, UsersTabCubitState>(
          builder: (context, state) {
            if (state is UsersTabCubitLoading) {
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is UsersTabCubitSuccess ||
                state is ClientUsersTabCubitSuccess ||
                state is OwnerUsersTabCubitSuccess ||
                state is AdminUsersTabCubitSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final user = cubit.usersList[index];
                    return UserInfoCard(user: user);
                  },
                  childCount: cubit.usersList.length,
                ),
              );
            }
            if (state is UsersTabCubitError) {
              return SliverToBoxAdapter(
                child: Center(child: Text('Error: ${state.errMessage}')),
              );
            }
            return SliverToBoxAdapter(
              child: Center(child: Text('No users available')),
            );
          },
        ),
      ],
    );
  }
}
