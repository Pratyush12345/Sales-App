
class GroupQuoteNote {
  String accountId;
  int groupId;
  Null notesText;
  List<Notes> notes;

  GroupQuoteNote({this.accountId, this.groupId, this.notesText, this.notes});

  GroupQuoteNote.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    groupId = json['GroupId'];
    notesText = json['NotesText'];
    if (json['Notes'] != null) {
      notes = new List<Notes>();
      json['Notes'].forEach((v) {
        notes.add(new Notes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['GroupId'] = this.groupId;
    data['NotesText'] = this.notesText;
    if (this.notes != null) {
      data['Notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notes {
  String strNote;
  String noteCreator;

  Notes({this.strNote, this.noteCreator});

  Notes.fromJson(Map<String, dynamic> json) {
    strNote = json['strNote'];
    noteCreator = json['NoteCreator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strNote'] = this.strNote;
    data['NoteCreator'] = this.noteCreator;
    return data;
  }
}
