import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'number_card.dart';

class EmergencyNumbers extends StatefulWidget {
  const EmergencyNumbers({Key? key}) : super(key: key);

  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class EmergencyNumber {
  int id = 0;
  String name = "null";
  int number = 0;

  EmergencyNumber({required this.id, required this.name, required this.number});

  EmergencyNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    return data;
  }
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  Column emergencyNumberCardsColumn = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [],
  );

  final String baseUri =
      "https://women-safety-xdmrc.herokuapp.com/emergency-numbers";

  Future<List<EmergencyNumber>> getEmergencyNumbers() async {
    // makes api request and populates column widget
    final res = await http.get(Uri.parse(baseUri));
    String jsonResponse;
    if (res.statusCode == 200) {
      jsonResponse = res.body;
    } else {
      exit(0);
    }

    List<dynamic> parsedListJson = jsonDecode(jsonResponse);
    List<EmergencyNumber> emergencyNumberList = List<EmergencyNumber>.from(
        parsedListJson.map((i) => EmergencyNumber.fromJson(i)));

    emergencyNumberCardsColumn.children.clear();
    for (var element in emergencyNumberList) {
      emergencyNumberCardsColumn.children.add(NumberCard(
          title: element.name, phoneNumber: element.number.toString()));
    }

    return emergencyNumberList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Emergency Numbers"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder<List<EmergencyNumber>>(
                // show spinner while api request completes
                future: getEmergencyNumbers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return emergencyNumberCardsColumn;
                  } else if (snapshot.hasError) {
                    return const Text("Could not load");
                  }
                  return Column(
                    children: const [
                      SizedBox(height: 40),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                }),
          ),
        ));
  }
}
