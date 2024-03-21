import 'package:note_app/utils/config.dart';

class ApiEndpoints {
  static const String apiUrl = '${AppConfig.baseUrl}/api/v1';
  static Uri register = Uri.parse('$apiUrl/register');

  // define more if need
}