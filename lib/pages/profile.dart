import 'package:dat216_projekt/widgets/profile/pfp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Profile extends StatelessWidget {
  @Preview(name: 'My Sample Text')
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Pfp();
  
  }
  /*
  Widget _buildForm() {
  return Container(
    height: 500,
    width:  800,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 212, 209, 209),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color.fromARGB(255, 110, 173, 113), width: 1.5),
    ),
    // child: Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     // LEFT COLUMN
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Placeholder(),
    //           const Divider(),
    //           Placeholder(),
    //           const Divider(),
    //           Placeholder(),
    //           ],
    //         ),
    //       ),
    //   ]
      // return Container(
      // padding: const EdgeInsets.all(16),
      // child: Column(
      //   crossAxisAlignment:
      //       CrossAxisAlignment.start, 
      //   children: [
      //     Text('Namn'),
      //     Row(
      //       children: [
      //           SizedBox(width: 250,  
      //           child: TextField(
      //             textAlign: TextAlign.center,
      //             decoration: InputDecoration(
      //               hintText: 'Hjördis efternamnsson',
      //               fillColor: Colors.white,
      //               filled: true,
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(8),
      //                 borderSide: BorderSide(color: Colors.grey, width: 1),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(width: 16),
      //         ElevatedButton(
      //           onPressed: () {},
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.green,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //           ),
      //           child: Text('Ändra', style: TextStyle(color: Colors.white)),
             
          );
     
  }
  */
}
