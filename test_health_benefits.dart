import 'dart:convert';
import 'dart:io';

void main() async {
  // Simulate the JSON parsing
  final String jsonString = '''
  [
    {
      "id": "hb_20_mins",
      "titleKey": "healthBenefitTitle_20mins",
      "descriptionKey": "healthBenefitDesc_20mins",
      "iconName": "favorite_border",
      "timeThresholdInMinutes": 20
    },
    {
      "id": "hb_test_null",
      "titleKey": "healthBenefitTitle_test",
      "descriptionKey": "healthBenefitDesc_test",
      "iconName": "favorite_border",
      "timeThresholdInMinutes": null
    }
  ]
  ''';

  final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
  
  for (var item in jsonList) {
    final Map<String, dynamic> jsonItem = item as Map<String, dynamic>;
    
    // Original code that caused the error
    // final int timeThreshold = (jsonItem['timeThresholdInMinutes'] as num).toInt();
    
    // Fixed code with null handling
    final int timeThreshold = (jsonItem['timeThresholdInMinutes'] as num?)?.toInt() ?? 0;
    
    print('ID: ${jsonItem['id']}, TimeThreshold: $timeThreshold');
  }
  
  print('Test completed successfully!');
}
