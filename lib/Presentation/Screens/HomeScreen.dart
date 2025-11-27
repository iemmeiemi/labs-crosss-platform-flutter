import 'package:client/Presentation/Screens/Labs/BMICal.dart';
import 'package:client/Presentation/Screens/Labs/Clima.dart';
import 'package:client/Presentation/Screens/Labs/Destini.dart';
import 'package:client/Presentation/Screens/Labs/Dice.dart';
import 'package:client/Presentation/Screens/Labs/IAmRich.dart';
import 'package:client/Presentation/Screens/Labs/MagicBall.dart';
import 'package:client/Presentation/Screens/Labs/MiCard.dart';
import 'package:client/Presentation/Screens/Labs/Quizzier.dart';
import 'package:client/Presentation/Screens/Labs/Xylophone.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final Widget screen;

  MenuItem({required this.title, required this.screen});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách các item, mỗi item truyền vào 1 màn hình khác nhau
    final List<MenuItem> menuItems = [
      MenuItem(title: "Lab 1: I am Rich", screen: const IAmRich()),
      MenuItem(title: "Lab 2: MiCard", screen: const MiCard()),
      MenuItem(title: "Lab 3: Dice", screen: const Dice()),
      MenuItem(title: "Lab 4: Magic 8 Ball", screen: const MagicBall()),
      MenuItem(title: "Lab 5: Xylophone", screen: Xylophone()),
      MenuItem(title: "Lab 6: Quizzler", screen: const Quizzier()),
      MenuItem(title: "Lab 7: Destini", screen: const Destini()),
      MenuItem(title: "Lab 8: BMI Calculator", screen: const BMICal()),
      MenuItem(title: "Lab 9: Clima", screen: const Clima()),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];

          return ListTile(
            title: Text(item.title),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.screen),
              );
            },
          );
        },
      ),
    );
  }
}
