/// is an abstract for data models that should be identified
/// or provide toJson

abstract class Model {
  int get id;
}

abstract class ToJson {
  Map<String, dynamic> toJson();
}
