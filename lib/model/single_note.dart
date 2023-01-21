class SingleNote {
  String? noteID;
  String? noteTitle;
  String? noteContent;
  String? createDateTime;
  Null? latestEditDateTime;

  SingleNote(
      {this.noteID,
      this.noteTitle,
      this.noteContent,
      this.createDateTime,
      this.latestEditDateTime});

  SingleNote.fromJson(Map<String, dynamic> json) {
    noteID = json['noteID'];
    noteTitle = json['noteTitle'];
    noteContent = json['noteContent'];
    createDateTime = json['createDateTime'];
    latestEditDateTime = json['latestEditDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noteID'] = this.noteID;
    data['noteTitle'] = this.noteTitle;
    data['noteContent'] = this.noteContent;
    data['createDateTime'] = this.createDateTime;
    data['latestEditDateTime'] = this.latestEditDateTime;
    return data;
  }
}
