class AddNoteModel {
  String? noteTitle;
  String? noteContent;

  AddNoteModel({this.noteTitle, this.noteContent});

  AddNoteModel.fromJson(Map<String, dynamic> json) {
    noteTitle = json['noteTitle'];
    noteContent = json['noteContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noteTitle'] = this.noteTitle;
    data['noteContent'] = this.noteContent;
    return data;
  }
}
