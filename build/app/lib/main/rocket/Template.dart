import 'TemplateTypes.dart';
import '../classes/ConnectionStatus.dart';
import '../classes/LoginResult.dart';

const int BOOLEAN = 0;

const int CONNECTIONSTATUS = 1;

const int DFILE = 2;

const int DATE = 3;

const int DATETIME = 4;

const int DOUBLE = 5;

const int DURATION = 6;

const int INTEGER = 7;

const int LOGINRESULT = 8;

const int STRING = 9;

const int TIME = 10;

const int TYPE = 11;

const int USER = 12;

class UsageConstants {}

class ChannelConstants {
  static const int TOTAL_CHANNEL_COUNT = 0;
  static final List<TemplateChannel> channels = [];
}

class Template {
  static String HASH = 'bca6b61c314738c93cb03b0f5fa23d86';
  static List<Usage> _usages = [];
  static List<TemplateType> _types = [
    TemplateType('Boolean', '27226c864bac7454a8504f8edb15d95b', []),
    TemplateType(
        'ConnectionStatus',
        '8febfca144e40770ec88581be7cfece5',
        [
          TemplateField('Connecting', 0, FieldType.Enum),
          TemplateField('Connected', 0, FieldType.Enum),
          TemplateField('ConnectionFailed', 0, FieldType.Enum),
          TemplateField('RestoreFailed', 0, FieldType.Enum),
          TemplateField('AuthFailed', 0, FieldType.Enum)
        ],
        refType: RefType.Enum),
    TemplateType('DFile', '71a781845a8ebe8adf67352a573af199', [
      TemplateField('id', STRING, FieldType.String),
      TemplateField('name', STRING, FieldType.String),
      TemplateField('size', INTEGER, FieldType.Integer),
      TemplateField('mimeType', STRING, FieldType.String)
    ]),
    TemplateType('Date', '44749712dbec183e983dcd78a7736c41', []),
    TemplateType('DateTime', '8cf10d2341ed01492506085688270c1e', []),
    TemplateType('Double', 'd909d38d705ce75386dd86e611a82f5b', []),
    TemplateType('Duration', 'e02d2ae03de9d493df2b6b2d2813d302', []),
    TemplateType('Integer', 'a0faef0851b4294c06f2b94bb1cb2044', []),
    TemplateType(
        'LoginResult',
        '43b15c92fa28924318ec2dd9b20d65d3',
        [
          TemplateField('failureMessage', STRING, FieldType.String),
          TemplateField('success', BOOLEAN, FieldType.Boolean),
          TemplateField('token', STRING, FieldType.String),
          TemplateField('userObject', USER, FieldType.Ref)
        ],
        refType: RefType.Struct,
        creator: () => LoginResult()),
    TemplateType('String', '27118326006d3829667a400ad23d5d98', []),
    TemplateType('Time', 'a76d4ef5f3f6a672bbfab2865563e530', []),
    TemplateType('Type', 'a1fa27779242b4902f7ae3bdd5c6d508', []),
    TemplateType('User', '8f9bfe9d1345237cb3b2b205864da075', [],
        abstract: true, refType: RefType.Model)
  ];
  static final Map<String, int> _typeMap = Map.fromIterables(
      _types.map((x) => x.name),
      List.generate(_types.length, (index) => index));
  static List<int> allFields(int type) {
    return List.generate(_types[type].fields.length, (index) => index);
  }

  static List<TemplateType> get types {
    return _types;
  }

  static List<Usage> get usages {
    return _usages;
  }

  static String typeString(int val) {
    return _types[val].name;
  }

  static int typeInt(String val) {
    return _typeMap[val];
  }

  static TemplateField _getField(int type, int val) {
    TemplateType _type = _types[type];

/*
_type will have fields with index starting from _type.parentFields.
Anything less needs to be looked up in _type.parent.
*/

    if (val < _type.parentFields) {
      return _getField(_type.parent, val);
    }

/*
The field cannot be in _type's child, so subtract _type.parentField from val, and use that as index.
*/

    int adjustedIndex = val - _type.parentFields;

    return _type.fields[adjustedIndex];
  }

  static String fieldString(int type, int val) {
    return _getField(type, val).name;
  }

  static int fieldType(int type, int val) {
    return _getField(type, val).type;
  }

  static bool isChild(int type, int val) {
    return _getField(type, val).child;
  }

  static int fieldInt(int type, String val) {
    TemplateType _type = _types[type];

    if (_type.fieldMap.containsKey(val)) {
      return _type.fieldMap[val];
    }

    if (_type.parent != null) {
      return fieldInt(_type.parent, val);
    }

    return null;
  }

  static bool isEmbedded(int type) {
    return _types[type].embedded;
  }

  static bool isAbstract(int type) {
    return _types[type].abstract;
  }

  static bool hasParent(int type) {
    return _types[type].parent != null;
  }

  static int parent(int type) {
    return _types[type].parent;
  }

  static T getEnumField<T>(int type, int field) {
    switch (type) {
      case CONNECTIONSTATUS:
        {
          return ConnectionStatus.values[field] as T;
        }
    }
  }
}
