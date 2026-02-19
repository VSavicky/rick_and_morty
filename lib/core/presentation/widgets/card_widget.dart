import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/models/character_model.dart';

class CardWidget extends StatelessWidget {
  final CharacterModel item;
  final VoidCallback onPressed;

  CardWidget({
    super.key,
    required this.item,
    required this.onPressed,
  });
  

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
              child: AspectRatio(aspectRatio: 1,
              child: Image.network(item.image, fit: BoxFit.cover)),
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
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        item.status,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                      IconButton(
                        onPressed: onPressed,
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
