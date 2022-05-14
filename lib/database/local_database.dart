import 'package:objectbox/objectbox.dart';

@Entity()
class LocalDatabase {

  late int id;
  late String price;
  late String min;
  late String sms;
  late String data;
  late String validity;
  late String code;
  late String titre;
  late String description;
  bool? pending = false;

  LocalDatabase({this.id = 0, required this.price, required this.min,required this.sms,required this.data , required this.validity,required this.code,required this.titre,required this.description,this.pending});

  
}