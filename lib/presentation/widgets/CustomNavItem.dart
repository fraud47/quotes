import 'package:flutter/material.dart';

import '../../app_pallete.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const CustomNavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 20,
              height: 20,
              colorFilter: isSelected? ColorFilter.mode(Colors.white,BlendMode.srcIn):ColorFilter.mode(Colors.grey,BlendMode.srcIn),

            ),
            SizedBox(height: 5,),
            Text("$label",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: isSelected?Colors.white:Colors.grey
                  ,
              fontSize: 13
            ),)
          ],
        )
        ,
      ),
    );
  }
}
