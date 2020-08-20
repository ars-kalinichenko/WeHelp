class PublicUser {
  int id;
  String name;
  String surname;
  String image;

  PublicUser({
    this.id,
    this.name,
    this.surname,
    this.image,
  });

  factory PublicUser.fromJson(Map<String, dynamic> json) {
    return PublicUser(
        id: json["id"] as int,
        name: json["name"] as String,
        surname: json["surname"] as String,
        image: json["image"] as String);
  }
}