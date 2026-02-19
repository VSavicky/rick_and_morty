import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  String name;
  int age;
  String imageSrc;
  VoidCallback onPressed;

  CardWidget({
    super.key,
    required this.name,
    required this.age,
    required this.imageSrc,
    required this.onPressed,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 0.5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
        children: [
          Flexible(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(widget.imageSrc, fit: BoxFit.cover),
            ),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        widget.age.toString(),
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                      IconButton(
                        onPressed: widget.onPressed,
                        icon: const Icon(Icons.star),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
