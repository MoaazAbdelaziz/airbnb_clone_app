part of 'users_tab_cubit.dart';

@immutable
sealed class UsersTabCubitState {}

final class UsersTabCubitInitial extends UsersTabCubitState {}

final class UsersTabCubitLoading extends UsersTabCubitState {}

final class UsersTabCubitSuccess extends UsersTabCubitState {}

final class ClientUsersTabCubitSuccess extends UsersTabCubitState {}

final class OwnerUsersTabCubitSuccess extends UsersTabCubitState {}

final class AdminUsersTabCubitSuccess extends UsersTabCubitState {}

final class AdminsUsersActiveTabCubit extends UsersTabCubitState {}

final class OwnersUsersActiveTabCubit extends UsersTabCubitState {}

final class ClientsUsersActiveTabCubit extends UsersTabCubitState {}

final class UsersTabCubitError extends UsersTabCubitState {
  final String errMessage;

  UsersTabCubitError(this.errMessage);
}
