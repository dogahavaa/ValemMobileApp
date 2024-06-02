import 'package:flutter/material.dart';
import 'package:valem_application/widgets/appBarDesigns.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: BrownValemAppBar(),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[Text("MY PROFILE")],
          ),
        ));
  }
}
