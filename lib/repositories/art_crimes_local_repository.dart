import 'package:art_crimes/models/art.dart';
import 'package:hive/hive.dart';

class ArtCrimesLocalRepository {
  Future<List<Art>?> getArtCrimes() async {
    await Future.delayed(const Duration(seconds: 2));
    var box = await Hive.openBox<List<Art>>('arts');
    final arts = box.get('arts');
    return arts;
  }

  void addArtCrimes(List<Art> arts) async {
    var box = await Hive.openBox<List<Art>>('arts');
    box.put('arts', arts);
  }
}
