import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iottive_pract/models/order_model.dart';
import 'package:iottive_pract/utils/app_preference.dart';
import 'package:iottive_pract/utils/constants.dart';
import 'package:iottive_pract/utils/dio_utils.dart';

@injectable
class HomeRepository {
  final Dio _dio = DioUtils.getDio();

  Future<List<OrderModel>> fetchOrders() async {
    final userModel = await AppPreference().getUser();

    final Map<String, dynamic> params = {
      'authToken': userModel.authToken,
      'userId': userModel.userId,
    };

    try {
      final response = await _dio.post(
        AppConstant.orderHistory,
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          final tempData = data['data'] as List<dynamic>;
          return OrderModel.fromDecodedJsonList(tempData);
        } else {
          throw Exception(data['message'] ?? 'Something went wrong');
        }
      } else {
        throw Exception('Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
