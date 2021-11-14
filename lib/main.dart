import 'package:flutter/material.dart';
import 'home_page_card.dart';
import 'emergency_numbers.dart';
import 'const.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hestia',
      theme: appTheme,
      home: const Home(title: 'Hestia'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.warning),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage("https://picsum.photos/400"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sabrina Ken",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const HomepageCard(
                    title: "User Info",
                    subTitle: "All info is filled. You're good to go!",
                    icon: Icons.check_circle_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const HomepageCard(
                      title: "Emergency Numbers",
                      subTitle: "Show and call on emergency numbers.",
                      icon: Icons.call,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EmergencyNumbers()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const HomepageCard(
                    title: "Share live location",
                    subTitle: "Share your location that updates in real time.",
                    icon: Icons.location_on,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const HomepageCard(
                    title: "Travel Mode",
                    subTitle:
                        "Your contacts will be automatically alerted if you don't return.",
                    icon: Icons.card_travel,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
