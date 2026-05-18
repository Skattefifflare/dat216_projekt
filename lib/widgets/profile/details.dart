import 'package:dat216_projekt/widgets/profile/name_field_with_button.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF2F2F2),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF6EAD71),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameFieldWithButton(label: "Namn", hintTxt: "Hjördis Efternamnsson"),
                const SizedBox(height: 8),
                const Divider()
                
              ],
            ),
            const SizedBox(width: 24),
            Container(width: 1.5, color: Colors.green, margin: const EdgeInsets.symmetric(horizontal: 16), height: 350),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameFieldWithButton(label: "Kortnummer", hintTxt: "9999 9999 9999 9999"),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                NameFieldWithButton(label: "Utgångsdatum", hintTxt: "12/34"),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                NameFieldWithButton(label: "CVC", hintTxt: "420"),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 250,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                NameFieldWithButton(label: "Telefonnummer", hintTxt: "+46 999 999 99 99"),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}