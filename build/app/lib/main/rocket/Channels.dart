import '../rocket/Template.dart';
import 'WSReader.dart';

class Channels {
  static void onMessage(WSReader reader) {
    int channel = reader.readInteger();

    switch (channel) {
    }
  }
}
