```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        //Check if 'someKey' exists before accessing
        if (jsonData.containsKey('someKey')) {
          return jsonData['someKey'];
        } else {
          throw Exception('JSON response missing required key: someKey');
        }
      } on FormatException {
        throw Exception('Invalid JSON format received from the API.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    //Consider rethrowing or returning an appropriate error value to the caller
    rethrow; // Or return a default value or null
  }
}
```