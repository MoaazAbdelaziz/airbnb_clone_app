import 'package:airbnb_clone_app/core/errors/failure.dart';
import 'package:airbnb_clone_app/core/utils/api_constants.dart';
import 'package:airbnb_clone_app/core/utils/api_service.dart';
import 'package:airbnb_clone_app/features/home/data/models/user_model/user_model.dart';
import 'package:airbnb_clone_app/features/home/data/repos/users_tab_repo/users_tab_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UsersTabRepo)
class UsersTabRepoImpl extends UsersTabRepo {
  final ApiService apiService;
  UsersTabRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<UserModel>>> fetchUsers() async {
    try {
      var response = await apiService.get('$baseUrl$usersEndpoint');
      List<UserModel> users = [];
      for (var user in response.data) {
        users.add(UserModel.fromJson(user));
      }
      return Right(users);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
