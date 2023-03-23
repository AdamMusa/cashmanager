import 'package:objectbox/objectbox.dart';

@Entity()
class LocalDatabase {

  int id;
  String price;
  String min ;
  String sms ;
  String data ;
  String validity ;
  String code ;
  String titre ;
  String description ;
  String numero ;
  bool? pending = true;

  LocalDatabase({this.id = 0, this.price="", this.min="",this.sms="",this.data ="" , this.validity ="",this.code ="", this.titre ="", this.description ="",this.pending,this.numero=""});

  
}