import 'package:flutter/material.dart';
import 'package:quotes/presentation/widgets/Card.dart';

class Cardstack extends StatefulWidget {
  const Cardstack({super.key});

  @override
  State<Cardstack> createState() => _CardstackState();
}


double topOffset = 100;
double expandedCardTop = topOffset;
double expandedHeight = 360;
double card1Top = expandedCardTop;
double card2Top = expandedCardTop + 60;
double card3Top = expandedCardTop + expandedHeight;
bool animateHeight = false;
int selectedCard = 1;

class _CardstackState extends State<Cardstack> {




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: expandedCardTop.forFirstStackCard,
            child: Flipcard(
              onClick: () {
                _update(1, topOffset);
              },
            )
        )
      ],
    );
  }
}
