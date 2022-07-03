import 'package:art_crimes/models/art.dart';
import 'package:dio/dio.dart';

class ArtCrimesRemoteRepository {
  static const pageSize = 20;

  Future<List<Art>> fetchArtCrimes(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await Dio().get('https://api.fbi.gov/@artcrimes?pageSize=$pageSize&page=$page');
    if (response.statusCode == 200) {
      return (response.data['items'] as List).map((e) => Art.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
