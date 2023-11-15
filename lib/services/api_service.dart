// File: lib/services/api_service.dart
import 'package:http/http.dart' as http;
import '../models/mobil.dart';

class ApiService {
    Future<List<Mobil>> fetchMobil() async {
        final response = await http.get(Uri.parse('YOUR_API_URL'));

        if (response.statusCode == 200) {
            List<dynamic> values = json.decode(response.body);
            return values.map((e) => Mobil.fromJson(e)).toList();
        } else {
            throw Exception('Failed to load data');
        }
    }
}
