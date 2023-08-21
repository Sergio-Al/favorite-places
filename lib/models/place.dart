import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  String id = '';
  String name = '';

  Place({required this.name}) {
    id = uuid.v4();
  }
}
