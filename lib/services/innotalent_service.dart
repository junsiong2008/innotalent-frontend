import 'package:devhack_2023/const.dart';
import 'package:devhack_2023/models/talent_stat.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InnotalentService {
  final String apiUrl = innoTalentUrl;

  Future<String> submitApplication(Uint8List resumeFile) async {
    final url = Uri.parse('$apiUrl/SubmitApplication');

    final request = http.MultipartRequest('POST', url);

    request.files.add(http.MultipartFile.fromBytes('file', resumeFile));

    final response = await request.send();

    var result = await response.stream.bytesToString();

    var decodedData = jsonDecode(result);

    return decodedData['talent_id'];
  }

  Future<TalentStat> getTalentStat(String talentId) async {
    final Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse('$apiUrl/Get/$talentId');

    final response = await http.get(
      url,
      headers: headers,
    );

    final jsonData = jsonDecode(response.body);

    final TalentStat talentStat = TalentStat.fromJson(jsonData);

    return talentStat;
  }
}
