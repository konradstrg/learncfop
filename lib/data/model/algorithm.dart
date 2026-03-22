abstract class Algorithm {
  /// ID of an algorithm.
  /// Rules: must start with "oll", "pll", "oll2llok", "pll2look".
  /// Examples: "oll_0", "pll_15", "oll2look_3".
  final String _id;

  String label;
  String algorithm;
  String? notes;
  bool _isPinned;

  Algorithm({
    required String id,
    required this.label,
    required this.algorithm,
    this.notes,
    required bool isPinned,
  }) : _id = id,
       _isPinned = isPinned;

  String get id => _id;
  bool get isPinned => _isPinned;
  void togglePinned() => _isPinned = !_isPinned;

  factory Algorithm.fromJson(Map<String, dynamic> json) {
    if (json["id"].contains("oll")) {
      return OLLAlgorithm.fromJson(json);
    } else if (json["id"].contains("pll")) {
      return PLLAlgorithm.fromJson(json);
    } else {
      throw UnimplementedError(
        "Not a valid JSON for creating an algorithm object",
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "id": _id,
    "label": label,
    "algorithm": algorithm,
    "notes": notes,
    "isPinned": _isPinned,
  };
}

class OLLAlgorithm extends Algorithm {
  final List<int> _caseConfiguration;

  OLLAlgorithm({
    required super.id,
    required super.label,
    required super.algorithm,
    super.notes,
    required super.isPinned,
    required List<int> caseConfiguration,
  }) : _caseConfiguration = caseConfiguration;

  @override
  factory OLLAlgorithm.fromJson(Map<String, dynamic> json) => OLLAlgorithm(
    id: json["id"] as String,
    label: json["label"] as String,
    algorithm: json["algorithm"] as String,
    notes: json["notes"] as String?,
    isPinned: json["isPinned"] as bool,
    caseConfiguration: (json["caseConfiguration"] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
  );

  List<int> get caseConfiguration => _caseConfiguration;

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    "caseConfiguration": _caseConfiguration,
  };
}

class PLLAlgorithm extends Algorithm {
  final List<String> _caseConfiguration;
  final List<List<dynamic>> _arrows;

  PLLAlgorithm({
    required super.id,
    required super.label,
    required super.algorithm,
    super.notes,
    required super.isPinned,
    required List<String> caseConfiguration,
    required List<List<dynamic>> arrows,
  }) : _caseConfiguration = caseConfiguration,
       _arrows = arrows;

  @override
  factory PLLAlgorithm.fromJson(Map<String, dynamic> json) => PLLAlgorithm(
    id: json["id"] as String,
    label: json["label"] as String,
    algorithm: json["algorithm"] as String,
    notes: json["notes"] as String?,
    isPinned: json["isPinned"] as bool,
    caseConfiguration: (json["caseConfiguration"] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    arrows: (json["arrows"] as List<dynamic>)
        .map((e) => e as List<dynamic>)
        .toList(),
  );

  List<String> get caseConfiguration => _caseConfiguration;
  List<List> get arrows => _arrows;

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    "caseConfiguration": _caseConfiguration,
    "arrows": _arrows,
  };
}
