import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iottive_pract/models/user_model.dart';
import 'package:iottive_pract/utils/constants.dart';
import 'package:iottive_pract/utils/dio_utils.dart';

@injectable
class AuthRepository {
  final Dio _dio = DioUtils.getDio();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        AppConstant.login,
        queryParameters: {'Email': email, 'Password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          return UserModel.fromJson(data);
        } else {
          throw Exception(data['message'] ?? 'Login failed');
        }
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
