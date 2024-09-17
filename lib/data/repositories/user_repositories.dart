import 'package:exam_6_month/data/models/my_model.dart';
import 'package:exam_6_month/services/user_databases.dart';

class UserRepositories{
  final UserDatabases _databases;

  UserRepositories({required UserDatabases database}) : _databases = database;

  Future<void> editUser(MyModel model) async{
    await _databases.deleteUser();
    await _databases.addUser(model);
  }

  Future<void> deleteMyUser() async{
    await _databases.deleteUser();
  }

  Future<void> getMyUser()  async{
    await _databases.getMyUser();
  }

  Future<void> inputUserDetails(MyModel model) async{
    await _databases.addUser(model);
  }

  Future<void> deleteUser() async{
    await _databases.deleteUser();
  }
}