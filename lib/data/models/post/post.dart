class PostModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  PostModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.title,
      this.family,
      this.image,
      this.imageUrl});

  static List<PostModel> fromData(List<Map<String, dynamic>> data) {
    return data.map((character) => PostModel.fromJson(character)).toList();
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['title'] = title;
    data['family'] = family;
    data['image'] = image;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
