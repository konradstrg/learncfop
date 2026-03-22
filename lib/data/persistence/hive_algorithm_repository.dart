import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import '../../data/model/algorithm.dart';
import '../../data/persistence/algorithm_repository.dart';

/// Implementation of AlgorithmRepository. Uses Hive for local storage.
class HiveAlgorithmRepository implements AlgorithmRepository {
  late final Box _box;

  @override
  Future<void> startup() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _box = await Hive.openBox("algorithms");
  }

  @override
  Future<Map<String, Algorithm>> loadAllAlgorithms() async {
    assert(_box.isOpen, "Start Hive first with algorithmProvider.startup()");
    assert(_box.isNotEmpty, "Put algorithms in repository first");

    return _box.toMap().map(
      (key, value) =>
          MapEntry(key, Algorithm.fromJson(Map<String, dynamic>.from(value))),
    );
  }

  @override
  Future<void> storeAlgorithm(Algorithm algorithm) async {
    assert(_box.isOpen, "Start Hive first with algorithmProvider.startup()");

    _box.put(algorithm.id, algorithm.toJson());
  }
}
