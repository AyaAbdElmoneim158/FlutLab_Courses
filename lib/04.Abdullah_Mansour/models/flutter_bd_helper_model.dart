class FlutterDdHelperModel {
  int? id;
  String? stCol1 = "";
  String? stCol2 = "";

  FlutterDdHelperModel({this.id, this.stCol1, this.stCol2});

  @override
  String toString() {
    return 'ModelClass{id:$id,stCol1: $stCol1, stCol2: $stCol2}';
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'stCol1': stCol1, 'stCol2': stCol2};
  }
}
