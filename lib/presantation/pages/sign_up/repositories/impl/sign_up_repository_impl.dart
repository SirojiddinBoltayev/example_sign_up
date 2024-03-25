import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';

import '../../../../../../core/handlers/http_service.dart';
import '../../../../../../core/handlers/network_exception.dart';

import '../../../../../constants/app_api_error_helper.dart';
import '../../../../../core/handlers/api_result.dart';
import '../../../../../injection.dart';
import '../../data/sign_up_response.dart';
import '../sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  @override
  Future<ApiResult<dynamic>> register(
      {required String name,

      required String password,
      // required String passwordConfirmation,
      required String phoneNumber}) async {
    final data = <String, String>{
      "name": name,
      "phone_number": phoneNumber,
      "password": password,
      "password_confirmation": password

    };

    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post('api/mobile/register', data: data);
      return ApiResult.success(
        data: SignUpResponse.fromJson(response.data),
      );
    } on DioError catch (e) {
      debugPrint('==> register failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e),
      data: AppApiErrorHelper.message(e.response?.data)
      );
    } catch (e) {
      debugPrint('==> register failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }


}
