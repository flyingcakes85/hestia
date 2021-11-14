import 'package:flutter/material.dart';
import './emergency_card.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Flexible(
              child: Column(
                children: const [
                  EmergencyCard(
                    title: "Contact Friend",
                    subTitle: "Contact your friends and send details",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EmergencyCard(
                    title: "Contact Police",
                    subTitle: "Send details to nearest police station.",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EmergencyCard(
                    title: "Create FIR",
                    subTitle: "Create an FIR from the app.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
