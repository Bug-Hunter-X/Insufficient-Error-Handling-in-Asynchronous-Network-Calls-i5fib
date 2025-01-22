```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing data - potential error here if the JSON structure is unexpected
      final data = jsonData['someKey'];
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Here, the error handling is basic.  Adding specifics would be beneficial.
  }
}
```