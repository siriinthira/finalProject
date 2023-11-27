// import 'package:flutter/material.dart';

// class FivePointedStar extends StatefulWidget {
//   final ValueChanged<int> onChange;

//   const FivePointedStar({Key? key, required this.onChange}) : super(key: key);

//   @override
//   State<FivePointedStar> createState() => _FivePointedStarState();
// }

// class _FivePointedStarState extends State<FivePointedStar> {
//   int mycount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Your implementation of the star rating widget goes here
//         // For example, you can use IconButton or any other widget for each star
//         IconButton(
//           icon: Icon(Icons.star),
//           onPressed: () {
//             setState(() {
//               mycount++; // Increment mycount when a star is pressed
//               widget.onChange(mycount); // Notify the parent about the change
//             });
//           },
//         ),
//         // Add more IconButton widgets for additional stars as needed
//       ],
//     );
//   }
// }

// class StarRatingScreen extends StatefulWidget {
//   @override
//   _StarRatingScreenState createState() => _StarRatingScreenState();
// }

// class _StarRatingScreenState extends State<StarRatingScreen> {
//   int mycount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Star Rating Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FivePointedStar(
//               onChange: (count) {
//                 setState(() {
//                   mycount = count; // Update the local state when the star rating changes
//                 });
//               },
//             ),
//             Text(
//               'Star Rating: $mycount',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
