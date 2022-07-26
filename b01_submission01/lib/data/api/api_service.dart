import 'dart:convert';
import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:b01_submission01/data/model/restaurant_detail.dart';
import 'package:b01_submission01/data/model/restaurant_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  final _host = 'restaurant-api.dicoding.dev';

  Future<RestaurantResult?> getList() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load List of Restaurant');
    }
  }

  Future<List<Restaurant>?> getListBloc() async {
    Map<String, Object> params = {
      'filter[content_types][]': 'article',
      'page[size]': '25',
    };

    final response = await request(path: "list", parameters: params);
    return response['restaurant']
        .map<Restaurant>(RestaurantResult.fromJson)
        .toList(growable: false);
  }

  Future<RestaurantDetailResult> getDetail(String id) async {
    final response = await http.get(Uri.parse("${_baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Detail of Restaurant');
    }
  }

  Future<Map> request({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    final uri = Uri.https(_host, "", parameters);
    final headers = _headers;
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json; charset=utf-8',
        'Accept': 'application/json',
      };
}
