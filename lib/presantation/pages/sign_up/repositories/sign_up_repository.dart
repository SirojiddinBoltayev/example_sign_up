
import '../../../../core/handlers/api_result.dart';

abstract class SignUpRepository {
  Future<ApiResult<dynamic>> register({
    required String name,

    required String password,
    // required String passwordConfirmation,
    required String phoneNumber,
  });
}
