class User {
  int id;
  String fullName;
  String email;
  String selfDescription;
  String image;
  int rating;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.selfDescription,
      this.image,
      this.rating});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"] as int,
        fullName: json["name"] as String,
        email: json["email"] as String,

        // TODO: change to dynamic
        selfDescription:
            "I am passionate about my work. Because I love what I do,"
            " I have a steady source of motivation that drives me to do my best. "
            "In my last job, this passion led me to challenge myself daily and learn"
            " new skills that helped me to do better work. For example, I taught myself how to use Photoshop to improve"
            " the quality of our photos and graphics. I soon became the go-to person for any design needs.",
        // TODO: change to dynamic
        image:
            "https://static.tildacdn.com/tild3231-6132-4932-a434-306139333666/Grooming_manbeard.jpg",
        // TODO: change to dynamic
        rating: 5);
  }
}
