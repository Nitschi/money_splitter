import 'dart:convert';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;

class OAuthTokenRetriever {
  // Constants for OAuth2
  static const String authorizationEndpoint = 'https://cloud.example.com/index.php/apps/oauth2/authorize';
  static const String tokenEndpoint = 'https://flup.example.com/nextcloud-proxy/index.php/apps/oauth2/api/v1/token';
  static const String clientId = 'abc';
  static const String clientSecret = 'def';
  static const String redirectUri = 'http://localhost:5050/auth.html'; // This should match the redirect URI registered in Nextcloud and the one you set up for flutter_web_auth_2
  static const String callBackUrlScheme = 'localhost';

  static Future<String?> getToken() async {
      // Construct the authorization URL
      final url = Uri.parse('$authorizationEndpoint?response_type=code&client_id=$clientId&redirect_uri=$redirectUri').toString();
      print("URL: $url");
      // Use flutter_web_auth_2 to authenticate
      final result = await FlutterWebAuth2.authenticate(url: url, callbackUrlScheme: callBackUrlScheme);
      print("Authenticate Result: $result");
      // Extract authorization code from resulting URL
      final code = Uri.parse(result).queryParameters['code'];

      if (code == null) {
        throw Exception('Authorization code not found');
      }
      print("Code: $code");

      print("ready to get token");
      // Exchange the authorization code for an access token
      // TODO: has a CORS issue (or something else)
      // curl -v -X POST "https://flup.example.com/nextcloud-proxy/index.php/apps/oauth2/api/v1/token" -d "grant_type=authorization_code" -d "client_id=abc" -d "client_secret=def" -d "redirect_uri=http://localhost:5050/auth.html" -d "code=CODE_HERE"
      final response = await http.post(
        Uri.parse(tokenEndpoint),
        body: {
          'grant_type': 'authorization_code',
          'client_id': clientId,
          'client_secret': clientSecret,
          'redirect_uri': redirectUri,
          'code': code,
        },
      );
      print("Get Token response: $response");

      if (response.statusCode != 200) {
        throw Exception('Failed to retrieve access token');
      }

      final Map<String, dynamic> responseBody = json.decode(response.body);
      print(responseBody);
      return responseBody['access_token'] as String?;
  }
}
