import 'package:airbnb_clone_app/features/home/data/models/user_model/user_model.dart';
import 'package:airbnb_clone_app/features/home/data/repos/users_tab_repo/users_tab_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'users_tab_cubit_state.dart';

@injectable
class UsersTabCubit extends Cubit<UsersTabCubitState> {
  UsersTabCubit(this.usersTabRepo) : super(UsersTabCubitInitial());
  final UsersTabRepo usersTabRepo;

  List<UserModel> ownerUsers = [];
  List<UserModel> adminUsers = [];
  List<UserModel> clientUsers = [];
  List<UserModel> allUsers = [];
  List<UserModel> usersList = [];

  bool isClientsActive = false;
  bool isOwnersActive = false;
  bool isAdminsActive = false;

  Future<void> getUsers() async {
    emit(UsersTabCubitLoading());
    final result = await usersTabRepo.fetchUsers();
    result.fold(
      (failure) => emit(UsersTabCubitError(failure.message)),
      (users) {
        allUsers = users;
        ownerUsers = users.where((user) => user.role == 'owner').toList();
        adminUsers = users.where((user) => user.role == 'admin').toList();
        clientUsers = users.where((user) => user.role == 'client').toList();
        usersList = allUsers;
        emit(UsersTabCubitSuccess());
      },
    );
  }

  void changeClientActive() {
    if (isClientsActive) {
      _deactivateFilters(); // Deactivate if already active
    } else {
      isClientsActive = true;
      isOwnersActive = false;
      isAdminsActive = false;
      usersList = clientUsers;
      emit(ClientUsersTabCubitSuccess());
    }
  }

  void changeOwnerActive() {
    if (isOwnersActive) {
      _deactivateFilters();
    } else {
      isClientsActive = false;
      isOwnersActive = true;
      isAdminsActive = false;
      usersList = ownerUsers;
      emit(OwnerUsersTabCubitSuccess());
    }
  }

  void changeAdminActive() {
    if (isAdminsActive) {
      _deactivateFilters();
    } else {
      isClientsActive = false;
      isOwnersActive = false;
      isAdminsActive = true;
      usersList = adminUsers;
      emit(AdminUsersTabCubitSuccess());
    }
  }

  void _deactivateFilters() {
    isClientsActive = false;
    isOwnersActive = false;
    isAdminsActive = false;
    usersList = allUsers;
    emit(UsersTabCubitSuccess());
  }
}
