import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/config/constants.dart';
import 'package:portfolio/models/experiences_model.dart';
class ApiProvider{
  Future<List<Experience>> getExperiences() async {
    final response = await http.get(Constants.BLOG_API);
    if(response.statusCode==200){
      List blogs = json.decode(utf8.decode(response.bodyBytes))['response'];
      final results= blogs.map((blog)=>Experience.fromJson(blog)).toList();
      return results;
    }else{
      return null;
    }
  }
}