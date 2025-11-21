class WebtoonModel {
  String name;
  int id;
  String thumb;

  WebtoonModel({required this.name, required this.id, required this.thumb});

  // JSON에서 WebtoonModel 객체 생성
  factory WebtoonModel.fromJson(Map<String, dynamic> json) {
    return WebtoonModel(
      name: json['title'] ?? json['name'] ?? '',  // API 응답에 따라 조정
      id: int.parse(json['id'].toString()),
      thumb: json['thumb'] ?? '',
    );
  }
}
