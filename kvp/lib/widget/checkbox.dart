import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/checkbox.dart';

class CheckboxWithControllers extends StatelessWidget {
  const CheckboxWithControllers({super.key});

  @override
  Widget build(BuildContext context) {
    final checkboxProvider = Provider.of<CheckboxProvider>(context);

    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: checkboxProvider.checkboxState.keys.length,
        itemBuilder: (context, index) {
          final key = checkboxProvider.checkboxState.keys.elementAt(index);
          final value = checkboxProvider.checkboxState[key] ?? false;
          log("Value is a : $value");

          return CheckboxListTile(
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            checkColor: Colors.white,
            activeColor: Colors.yellow,
            title: Text(
              key,
              style: GoogleFonts.poppins(
                  color: Colors.yellow,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            value: value,
            onChanged: (bool? newValue) {
              log("newValue is a : $newValue");
              if (newValue != null) {
                checkboxProvider.updateCheckbox(key, newValue);
              }
            },
          );
        },
      ),
    );
  }
}
