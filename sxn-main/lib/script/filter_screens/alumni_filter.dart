import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/models/chat_user.dart';
import 'package:app/widgets/alumni_user_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:app/script/filter_screens/multi_filter.dart';
 
 
    
 
 
 
class AlumniFilterScreen extends StatefulWidget {

  //model of user
  final ChatUser user;
 
  const AlumniFilterScreen({Key? key, required this.user, }) : super(key: key);
 
  @override
  _AlumniFilterScreenState createState() => _AlumniFilterScreenState();
}
 
class _AlumniFilterScreenState extends State<AlumniFilterScreen> {

  //card result
  List<AlumniUserCard> alumniUserCards = [];
 
 
 // drop down search  x3

  final GlobalKey<DropdownSearchState<String>> _schoolDropdownKey =
      GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _universityDropdownKey =
      GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _eduLevelDropdownKey =
      GlobalKey();
 
 // List of selected options from dropdown search
  // List<String> selectedSkills = [];
  // List<String> selectedOccupations = [];
  // List<String> selectedHobbies = [];
  List<String> selectedOptions =[];
 
 // list of data from each fields from docs
  List<String> schools = [];
  List<String> universities = [];
  List<String> educationLevel = [];
 
  // สร้าง StreamController สำหรับผู้ใช้ที่เลือกผ่านตัวกรอง เพื่อใช้ส่งข้อมูลผู้ใช้ไปยัง SteamBuilder ในภายหลัง
  StreamController<List<QueryDocumentSnapshot>> _usersStreamController = StreamController<List<QueryDocumentSnapshot>>();
 
    @override
  void dispose() {
    _usersStreamController.close();
    super.dispose();
  }
 
  // Fetch data from Firestore
  void fetchData(String collection, String field, List<String> listToUpdate) {
    FirebaseFirestore.instance.collection(collection).get().then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        listToUpdate.clear();
        querySnapshot.docs.forEach((doc) {
          if (doc.data().containsKey(field)) {
            List<dynamic> data = doc[field];
            for (var item in data) {
              if (!listToUpdate.contains(item)) {
                listToUpdate.add(item);
              }
            }
          }
        });
        print(listToUpdate);
        setState(() {});
      }
    });
  }
 
 // query by field function
  void _queryUsersBySchools() {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('schools', arrayContainsAny: selectedOptions);
 
        usersQuery.snapshots().listen((snapshot) {
          _usersStreamController.add(snapshot.docs);
         });
 
    // Use StreamBuilder to listen to changes in the query results and update the UI.
    // Example:
    // StreamBuilder<QuerySnapshot>(
    //   stream: usersQuery.snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator(); // Show a loading indicator.
    //     }
    //     if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     }
    //     if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
    //       return Text('No users found.');
    //     }
 
    //     // Extract users from snapshot and update the UI.
    //     // You can display user cards here.
    //   },
    // );
  }
 
  void _queryUsersByUniversities() {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('universities', arrayContainsAny: selectedOptions);
 
     
        usersQuery.snapshots().listen((snapshot) {
          _usersStreamController.add(snapshot.docs);
         });
   
  }
 
  void _queryUsersByEducationLevel() {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('educationLevel', arrayContainsAny: selectedOptions);
 
     
        usersQuery.snapshots().listen((snapshot) {
          _usersStreamController.add(snapshot.docs);
         });
   
  }
 
  @override
  void initState() {
    super.initState();
 
    // Fetch data for schools, universities, and eduLevel
    fetchData('users', 'schools', schools);
    fetchData('users', 'universities', universities);

    fetchData('users', 'educationLevel', educationLevel);
   
  }
 
  void _searchUsers() {
  // สร้างคิวรี่ Firestore เพื่อกรองผู้ใช้ตามตัวเลือกที่เลือก  
  // Create a Firestore query for filtering users based on selected options
  final usersQuery = FirebaseFirestore.instance.collection('users');
 
   // ใช้ตัวกรองตามค่าที่เลือกจาก DropdownSearch
  // Apply filters based on selected dropdown values
  // if (selectedSkills.isNotEmpty) {
  //   usersQuery.where('skills', arrayContainsAny: selectedSkills);
  // }
  // if (selectedOccupations.isNotEmpty) {
  //   usersQuery.where('occupation', arrayContainsAny: selectedOccupations);
  // }
  // if (selectedHobbies.isNotEmpty) {
  //   usersQuery.where('hobbies', arrayContainsAny: selectedHobbies);
  // }
 
   // ใช้ตัวกรองตามค่าที่เลือกจาก DropdownSearch
  if (selectedOptions.isNotEmpty) {
    usersQuery.where('your_field_name', arrayContainsAny: selectedOptions);
  }
 
 
   // ฟังก์ชันฟังคิวรี่ผู้ใช้
  // Listen to the query results using StreamBuilder
  usersQuery.snapshots().listen((snapshot) {
    _usersStreamController.add(snapshot.docs);
  });
}
 
// void _searchUsers() {
//   final usersQuery = FirebaseFirestore.instance.collection('users');

//   if (selectedOptions.isNotEmpty) {
//     usersQuery.where('your_field_name', arrayContainsAny: selectedOptions);
//   }

//   usersQuery.get().then((querySnapshot) {
    
//     List<AlumniUserCard> alumniUserCards = [];

//     querySnapshot.docs.forEach((doc) {

//       final user = doc.data() as Map<String, dynamic>;

//       final username = user['username'] as String? ?? 'User Found';

//       final schools = (user['schools'] is List<String>)
//           ? (user['schools'] as List<String>).join(', ')
//           : 'No schools';

//       final universities = (user['universities'] is List<String>)
//           ? (user['universities'] as List<String>).join(', ')
//           : 'No universities';

//       alumniUserCards.add(AlumniUserCard(
//         user: ChatUser(
//           // Initialize ChatUser with appropriate fields
//           username: username,
//           image: user['image'] as String, // Assuming there is an 'image' field in my user data
//           universities: user['universities'] as List<String>, // Replace with actual field
//           schools: user['schools'] as List<String>, 
//           occupation: [], 
//           createdAt: '', 
//           educationLevel: [], 
//           experience: [], 
//           certification: [], 
//           skills: [], 
//           hobbies: [], 
//           location: '', 
//           lastActive: '', 
//           id: '', 
//           isOnline: false, 
//           selfIntro: '', 
//           email: '', 
//           pushToken: '', // Replace with actual field
//           // Add other fields as needed
//         ),
//       ));
//     });

//     setState(() {
//       this.alumniUserCards = alumniUserCards;
//     });
//   });
// }


 
  @override
  Widget build(BuildContext context) {
 
//       // เพิ่ม StreamBuilder ที่ดีดแปลง เพื่อแสดงผลผู้ใช้จาก Firestore โดยใช้ StreamController ที่เราสร้างไว้: แสดงผลในรูปแบบ alumniUserCards
//       StreamBuilder<List<QueryDocumentSnapshot>>(
//   stream: _usersStreamController.stream,
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator(); // Show a loading indicator.
//     }
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     }
//     if (!snapshot.hasData || snapshot.data!.isEmpty) {
//       return Text('No users found.');
//     }

//     // Use the alumniUserCards list to display user cards
//     return Column(
//       children: alumniUserCards,
//     );
//   },
// );


    return Scaffold(
      appBar: AppBar(title: Text("Filter Alumni")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Filter Schools & Universities'),
            SizedBox(height: 30),
            Text('Find whom you want to contact', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.grey.shade800),),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 30),
                 ElevatedButton(
                        onPressed: () {
                         Navigator.push(context,
                         MaterialPageRoute(builder: (context) => MultiFilterScreen(user: widget.user)),
                        );
                        },
                        child: Text("Filter Jobs & Skills"),
                      ),
                      SizedBox(width: 30),
                       ElevatedButton(
                        onPressed: () {
                        //  Navigator.push(context,
                        //  MaterialPageRoute(builder: (context) => MultiFilterScreen(user: widget.user)),
                        //  );
                        },
                        child: Text("  Filter Alumni  "),
                      ),
              ],
            ),
           
            SizedBox(height: 30,),
            Text('Pick Schools'),
            //Schools Dropdown
            DropdownSearch<String>.multiSelection(
              key: _schoolDropdownKey,
              items: schools,
              onChanged: (selectedItems) {
                setState(() {
                  selectedOptions = selectedItems;
                  _queryUsersBySchools();
                });
              },
            ),
           
           Divider(),
 
            SizedBox(height: 30,),
            Text('Pick Universities'),
           // Universities Dropdown
            DropdownSearch<String>.multiSelection(
              key: _universityDropdownKey,
              items: universities,
              onChanged: (selectedItems) {
                setState(() {
                  selectedOptions = selectedItems;
                  _queryUsersByUniversities();
                });
              },
            ),
 
           Divider(),
            SizedBox(height: 30,),
            Text('Pick Education Level'),
          //  Education History Dropdown
            DropdownSearch<String>.multiSelection(
              key: _eduLevelDropdownKey,
              items: educationLevel,
              onChanged: (selectedItems) {
                setState(() {
                  selectedOptions = selectedItems;
                  _queryUsersByEducationLevel();
                });
              },
            ),
 
           Divider(),
                         ElevatedButton(
                        onPressed: () {
                          // Call the search function here
                          _searchUsers();
                        },
                        child: Text("Find Match"),
                      ),
 
 
                 // แสดงผู้ใช้จาก Firestore โดยใช้ StreamBuilder
          StreamBuilder<List<QueryDocumentSnapshot>>(
            stream: _usersStreamController.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // แสดงตัวแสดงการโหลด
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No users found.');
              }
 

 
             // แสดงผู้ใช้ที่พบ
                    return Column(
                children: snapshot.data!.map((doc) {
                  final user = doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
   
                  final username = user['username'] as String? ?? 'user found';
                  final schools = (user['schools'] is List<String>)
                      ? (user['schools'] as List<String>).join(', ')
                      : 'matched result';
                  final universities = (user['universities'] is List<String>)
                      ? (user['universities'] as List<String>).join(', ')
                      : 'user found';
 
                  return 
                  
                  ListTile(
                    title: Text(username),
                    subtitle: Text(universities, maxLines: 1),
                    trailing: Text(schools, maxLines: 1),
                  );
                 }).toList(),
              );
 
            },
          ),
          ],
        ),
      ),
    );
 
  }
}
 
 
 
 
 