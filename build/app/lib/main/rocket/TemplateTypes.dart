import 'Template.dart';

import '../classes/core.dart';
import '../utils/DBObject.dart';

enum FieldType {
  String,
  Integer,
  Double,
  Boolean,
  Date,
  DateTime,
  Time,
  Duration,
  DFile,
  Enum,
  Ref,
}

enum RefType { Model, Struct, Enum }

class TemplateField {
  final String name;
  final int type;
  final bool child;
  final bool collection;
  final bool inverse;
  bool unknown = false;
  final FieldType fieldType;
  TemplateField(this.name, this.type, this.fieldType,
      {this.child = false, this.collection = false, this.inverse = false});
}

class Usage {
  String name;
  String hash;
  List<TypeUsage> types;
  Usage(this.name, this.types, this.hash);
}

class TypeUsage {
  int type;
  List<FieldUsage> fields;
  TypeUsage(this.type, this.fields);
}

class FieldUsage {
  int field;
  List<TypeUsage> types;
  FieldUsage(this.field, this.types);
}

class TemplateType {
  final String name;
  final List<TemplateField> fields;
  Map<String, int> fieldMap;
  final bool embedded;
  final int parent;
  final bool abstract;
  final int parentFields;
  final String hash;
  final RefType refType;
  final Supplier<DBObject> creator;
  bool unknown = false;
  TemplateType(this.name, this.hash, this.fields,
      {this.embedded = false,
      this.parent = 0,
      this.abstract = false,
      this.refType,
      this.parentFields = 0,
      this.creator}) {
    fieldMap = Map.fromIterables(fields.map((x) => x.name),
        List.generate(fields.length, (index) => index + this.parentFields));
  }

  TemplateField operator [](int index) {
    if (index < parentFields) {
      return Template.types[parent][index];
    }
    return fields[index - parentFields];
  }
}

class TemplateChannel {
  final String name;
  final String hash;
  final List<TemplateMessage> messages;
  TemplateChannel(this.name, this.hash, this.messages);
}

class TemplateMessage {
  final String name;
  final List<TemplateParam> params;
  TemplateMessage(this.name, this.params);
}

class TemplateParam {
  final int type;
  final bool collection;
  TemplateParam(this.type, {this.collection = false});
}
