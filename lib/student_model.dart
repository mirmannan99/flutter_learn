class StudentModel {
  String? rollNo;
  String? name;
  String? grade;

  StudentModel({this.rollNo, this.name, this.grade});

  StudentModel.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.grade = map['grade'];
    this.rollNo = map['rollNo'];
  }

  //
  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "grade": this.grade,
      "rollNo": this.rollNo,
    };
  }
}
