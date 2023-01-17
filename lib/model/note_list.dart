class Note {
  String? noteID;
  String? noteTitle;
  String? createDateTime;
  String? latestEditDateTime;

  Note(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.latestEditDateTime});

  Note.fromJson(Map<String, dynamic> json) {
    noteID = json['noteID'];
    noteTitle = json['noteTitle'];
    createDateTime = json['createDateTime'];
    latestEditDateTime = json['latestEditDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noteID'] = this.noteID;
    data['noteTitle'] = this.noteTitle;
    data['createDateTime'] = this.createDateTime;
    data['latestEditDateTime'] = this.latestEditDateTime;
    return data;
  }
}
