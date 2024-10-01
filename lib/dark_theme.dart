import 'package:flutter/material.dart';

import 'app_pallete.dart';
import 'config.dart';

class AppTheme{

  static final darkMode = ThemeData(
      colorScheme:  ColorScheme.light(
          surface: Colors.white,

          secondary: Colors.grey.shade200,
          tertiary: Colors.white,
          inversePrimary: Colors.grey.shade900
      ),





      fontFamily: "Poppins",
      textTheme: Config.textTheme,

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 20)),

              backgroundColor: WidgetStateProperty
                  .all<Color>(AppPallete.primary),
              foregroundColor: WidgetStateProperty.all<Color>(AppPallete.whiteColor)

          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(

          style: ButtonStyle(

            padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 20)),


            backgroundColor: WidgetStateProperty
                .all<Color>(AppPallete.transparentColor),
            side:  WidgetStateProperty.resolveWith<BorderSide>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return const BorderSide(
                      color: AppPallete.primary,
                      width: 1,
                    );
                  }
                  else{
                    return const BorderSide(
                      color: AppPallete.greyColor,
                      width: 1,
                    );
                  }

                }
            ),



            foregroundColor: WidgetStateProperty.all<Color>(AppPallete.black),


          )
      )
  );

}



