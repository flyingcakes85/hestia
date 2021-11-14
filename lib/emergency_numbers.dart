import 'package:flutter/material.dart';
import 'number_card.dart';

class EmergencyNumbers extends StatefulWidget {
  const EmergencyNumbers({Key? key}) : super(key: key);

  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Numbers"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NumberCard(
              title: "title", subTitle: "Some text ", icon: Icons.access_alarm)
        ],
      ),
    );
  }
}
