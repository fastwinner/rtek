import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = 'http://192.168.252.18:8000/api';
  static const String baseUrl2 = 'http://192.168.255.210:8000/api';

  static Future<Map<String, dynamic>> register(String nom, String prenom,
      String email, String password, String numero) async {
    try {
      var url = Uri.parse('$baseUrl2/register');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "nom": nom,
          "prenom": prenom,
          "password": password,
          "email": email,
          "numero_de_telephone": numero,
        }),
      );
      var data = jsonDecode(response.body);
      if (data["login_link"] != null) {
        return {"success": true};
      } else {
        return {"success": false, "errors": data['errorsList'] ?? {}};
      }
    } catch (error) {
      print(
          'Une erreur est survenue pendant la creation de l\'utilisateur: $error');
      return {
        "success": false,
        "errors": {
          "general": ["Une erreur inattendue s'est produite."]
        }
      };
    }
  }

  static Future<Map<String, dynamic>> loginUser(String email, String password) async {

    try {
      final response = await http.post(
        Uri.parse('$baseUrl2/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'mot_de_passe': password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          'success': false,
          'status_message': 'Failed to login, status code: ${response.statusCode}'
        };
      }
    } catch (error) {
      return {
        'success': false,
        'status_message': 'An error occurred: $error',
      };
    }
  }
}
