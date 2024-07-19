import 'package:rshttk/auth/message.dart';

validInput(String val, int min, int max) {
  if (val.length > max) {
    return "$messageInputMax";
  }
  if (val.isEmpty) {
    return "$messageInputEmpty";
  }
  if (val.length < min) {
    return "$messageInputMin";
  }
  
}
