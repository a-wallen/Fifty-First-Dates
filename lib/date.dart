class Date {
  String title;
  String description;

  String get getTitle => title;

  set setTitle(String title) => this.title = title;

  String get getDescription => description;

  set setDescription(String description) => this.description = description;

  void printDate() {
    print("title: ${this.title}");
    print("desc: ${this.description}");
  }

  Date(String title, String description) {
    this.title = title;
    this.description = description;
  }
}
