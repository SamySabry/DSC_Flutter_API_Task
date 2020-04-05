class Post {
  final String picture;
  final int index;
  final String name;
  final String company;

  final String about;
  final String email;

  Post({this.picture, this.index, this.name, this.company,this.about, this.email});

  factory Post.fromJson(Map<String,dynamic> json) {
    return Post(
      picture: json['picture'],
      index: json['index'],
      name: json['name'],
      company: json['company'],
      about: json['about'],
      email: json['email'],
    );
  }
}