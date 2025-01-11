import 'package:airbnb_clone_app/core/errors/failure.dart';
import 'package:airbnb_clone_app/features/home/data/models/user_model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UsersTabRepo {
  Future<Either<Failure, List<UserModel>>> fetchUsers();
}
