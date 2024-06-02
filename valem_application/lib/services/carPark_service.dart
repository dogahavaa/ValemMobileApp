import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:valem_application/services/models/otopark.dart';

class CarParkService {
  final carparks = FirebaseFirestore.instance.collection("carpark");

  registerCarPark(Otopark otopark, String userid) {
    var uuid = const Uuid().v1();
    carparks.doc(uuid).set({
      'id': userid,
      'name': otopark.name,
      'phone': otopark.phone,
      'email': otopark.email,
      'password': otopark.password,
      'creationtime': otopark.creationtime
    });
  }
}
