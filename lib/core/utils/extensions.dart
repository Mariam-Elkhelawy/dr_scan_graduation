
import 'enums.dart';

extension BodyPartExtension on BodyPart {
  String toJson() {
    return toString().split('.').last;
  }

  static BodyPart fromJson(String json) {
    return BodyPart.values.firstWhere((element) => element.toJson() == json);
  }
}
