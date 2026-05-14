import 'package:flutter/material.dart';

class NameFieldWithButton extends StatelessWidget {
  final String label;
  final String hintTxt;
 
 const NameFieldWithButton({super.key, required this.label, required this.hintTxt,});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(label),
        Row(
          children: [
            Expanded(
               child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: hintTxt,
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                ),
              ),
            ),
          SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Ändra', style: TextStyle(color: Colors.white))),
             
          ]
        )

      ],
      );
    }
  }