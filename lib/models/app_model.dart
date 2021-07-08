
import 'package:flutter_tutorial/models/user.dart';

class Message {
  final String content;
  final User user;
  final String time;
  final bool unread;
  bool isLiked;

  Message(
    this.content , this.user , this.time , this.unread , this.isLiked
  );
}

final User leonard = User(1, "Leonard", "assets/images/60.jpg");
final User amabel = User(2, "Amabel", "assets/images/82.jpg");
final User jonathan = User(3, "Jonathan", "assets/images/79.jpg");
final User kenny = User(4, "Kenny", "assets/images/35.jpg");
final User kent = User(5, "Kenny", "assets/images/41.jpg");

final List<User> favourite_contact = [leonard , amabel, jonathan , kenny];

final Message message1 = Message("Halo selamat pagi!" , leonard , "17:00" , true , false);
final Message message2 = Message("Kamu lagi apa?" , amabel , "18:01" , false , false);
final Message message3 = Message("Oke nanti dikabarin lagi yah" , jonathan , "21:38" , true , false);
final Message message4 = Message("Emangnya kemarin kenapa?" , kenny , "08:20" , false , false);
final Message message5 = Message("Mantabb dah sippp" , kent , "08:20" , true , false);

final List<Message> recent_chat = [message1 , message2 , message3 , message4 , message5];


final Message chat1 = Message("Halo selamat pagi!" , leonard , "17:00" , true , true);
final Message chat2 = Message("Halo ada apa yah?" , amabel , "17:10" , true , true);
final Message chat3 = Message("Kamu lagi sibuk gak hari ini, Aku mau minta tolong?" , leonard , "17:20" , true , false);
final Message chat4 = Message("Engga kok, kenapa?" , amabel , "17:30" , true , false);
final Message chat5 = Message("Bisa kirim email tugas yang kemarin gak ya?" , amabel , "17:40" , true , false);

final List<Message> list_chat = [chat1, chat2, chat3 , chat4, chat5];

