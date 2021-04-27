import 'package:challenge_pokeapi/models/result.dart';

class Type {
  int count;
  List<Result> results;

  Type({this.count, this.results});

  Type.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Result>();
      json['results'].forEach((v) {
        results.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}