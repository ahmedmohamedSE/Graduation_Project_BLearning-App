class Field {
  final int? id;
  final String? name;
  final String? subtitle;

  Field(this.id, this.name, this.subtitle);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'subtitle':subtitle
    };
  }

  // static Field fromMap(Map<String, dynamic> map) {
  //   return Field(
  //     id: map['id'],
  //     name: map['name'],
  //     subtitle:map['subtitle']
  //   );
  // }
}

class Question {
  final int? id;
  final String? field;
  final String? text;
  final List<String>? choices;
  final int? answerIndex;

  Question({this.id, this.field, this.text, this.choices, this.answerIndex});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'field': field,
      'text': text,
      'choices': choices!.join('|'),
      'answerIndex': answerIndex,
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    List<String> choices = (map['choices'] as String).split('|');
    return Question(
      id: map['id'],
      field: map['field'],
      text: map['text'],
      choices: choices,
      answerIndex: map['answerIndex'],
    );
  }
}