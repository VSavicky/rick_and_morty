import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/presentation/widgets/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final names = [
  "Rick",
  "Morty",
  "Summer",
  "Rick",
  "Morty",
  "Summer",
  "Rick",
  "Morty",
  "Summer",
  "Rick",
  "Morty",
  "Summer",
  "Rick",
  "Morty",
  "Summer",
];
final age = [
  70,
  14,
  16,
  70,
  14,
  16,
  70,
  14,
  16,
  70,
  14,
  16,
  70,
  14,
  16,
  70,
  14,
  16,
  70,
  14,
  16,
];
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          padding: EdgeInsets.all(20),
          itemCount: names.length,
          itemBuilder: (context, index) {
            return CardWidget(
              name: names[index],
              age: age[index],
              onPressed: () {},
              imageSrc:
                  'https://i.pinimg.com/736x/66/6c/5d/666c5d498c37e99ac61d1821f9472ecc.jpg',
            );
          },
        ),
      ),
    );
  }
}