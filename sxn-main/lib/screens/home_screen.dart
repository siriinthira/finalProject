import 'dart:async';
import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../models/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/contact_screen.dart';
import 'package:app/widgets/home_user_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/widgets/filter_user_card.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/screens/auth/login_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/script/filter_screens/multi_filter.dart';
 
 
 
//home screen -- where all available contacts are shown
class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});
 // const HomeScreen(key: key);
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
//-------------------           Part 1   logout function       ------------------------------------------------//
 
// Function to handle the logout process
  Future<void> _handleLogout() async {
    // Show a progress dialog
    Dialogs.showProgressBar(context);
 
    try {
      // Sign out from Firebase and Google
      await APIs.auth.signOut();
      await GoogleSignIn().signOut();
 
      // Hide the progress dialog
      Navigator.pop(context);
 
      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } catch (e) {
      // Handle any errors that occurred during sign-out, e.g., show an error dialog
      Dialogs.showSnackbar(context, 'Error signing out: $e');
    }
  }
 
//-------------------           Part 2   switch case function for buttom nav bar       ------------------------------------------------//
 
// Bottom Nav Bar switch case function
  int _selectedIndex = 0;
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
 
      switch (index) {
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ContactScreen()));
          break;
 
        case 2:
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: APIs.me)));
          break;
 
        case 3:
          _handleLogout();
          break;
      }
    });
  }
 
  //-------------------           Part 3  lists for Search bar        ------------------------------------------------//
 
  // for storing all users : Your list of ChatUser data
  List<ChatUser> _list = [];
 
  //SearchBar named '_valueContains'
  TextEditingController? _valueContains = TextEditingController();
 
  //SearchList aka my list of search item
  List<ChatUser> itemListOnSearch = [];
 
  // for storing all users chat data
  List<ChatUser> chatUserData = [];
 
    //-------------------           Part 4 Filter Dialog & dropdown search         ------------------------------------------------//
 
  // for storing filtered users
  List<ChatUser> filteredUsers = [];
 
  // Create variables to store the selected filter values from dropdown search
  List<String> selectedSchools = [];
  List<String> selectedUniversities = [];
  List<String> selectedEducationLevel = [];
 
  List<String> selectedSkills = [];
  List<String> selectedOccupation = [];
  List<String> selectedHobbies = [];
 
  //to store fetched data then we will use this data show on dropdown list
  List<String> schools = [];
  List<String> universities = [];
  List<String> educationLevel = [];
 
  List<String> skills = [];
  List<String> occupation = [];
  List<String> hobbies = [];
 
  // create global keys for dropdown search <UI>
  final GlobalKey<DropdownSearchState<String>> _schoolsDropdownKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _universitiesDropdownKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _educationLevelDropdownKey = GlobalKey();
 
  final GlobalKey<DropdownSearchState<String>> _skillsDropdownKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _occupationDropdownKey = GlobalKey();
  final GlobalKey<DropdownSearchState<String>> _hobbiesDropdownKey = GlobalKey();
 
    // สร้าง StreamController สำหรับผู้ใช้ที่เลือกผ่านตัวกรอง เพื่อใช้ส่งข้อมูลผู้ใช้ไปยัง SteamBuilder ในภายหลัง
  StreamController<List<QueryDocumentSnapshot>> _usersStreamController = StreamController<List<QueryDocumentSnapshot>>();
     
  @override
  void initState() { // เมธอดที่โดนเรียกเมื่อมีการสร้างวิตเจ็ท ใช้กำหนดสถานะและเตรียมข้อมูลในวิทเจ็ต
    super.initState();
    APIs.getSelfInfo(); //ดึงข้อมูลโทเคนของผู้ใช้ และ ตรวจสอบสถานะการเข้าใช้งาน
    readData(); //อ่านและดึงข้อมูลที่วิตเจ็ตจะใช้เพื่อประมวลผล
        // Fetch data for skills, occupations, and hobbies ข้อมูลตรงนี้นำแสดงบนลิสต์ของ dropdown search
    fetchData('users', 'schools', schools); //the third value is what we initialized ealier to store fetched data and queried data on line 114
    fetchData('users', 'universities', universities);
    fetchData('users', 'educationLevel', educationLevel);
    fetchData('users', 'skills', skills);
    fetchData('users', 'occupation', occupation);
    fetchData('users', 'hobbies', hobbies);
 
    // SystemChannels.lifecycle.setMessageHandler((message) {
    //   log('Message: $message');
 
    //   // if (APIs.auth.currentUser != null) {
    //   //   if (message.toString().contains('resume')) {
    //   //     APIs.updateActiveStatus(true);
    //   //   }
    //   //   if (message.toString().contains('pause')) {
    //   //     APIs.updateActiveStatus(false);
    //   //   }
    //   // }
 
    //   return Future.value(message);
    // }
    // );
  }
 
  Future<void> readData() async {
    await Firebase.initializeApp().then((value) async {
      // เชื่อมต่อกับ firebase ก่อน แล้วค่อยทำคำสั่งต่อไป
      print("Initialize Success");
      var x = await FirebaseFirestore
          .instance // สร้างออปเจกต์ของ FirebaseFirestore เพื่อ ดึงข้อมูลจากคอลเลคชัน user ใน field ของ skills
          .collection('users')
          .orderBy('skills')
          .get();
      x.docs.forEach((element) {
        // วนลูปผ่านเอกสารบน firestore และประมวลข้อมูล
        print(element.data());
        ChatUser model = ChatUser.fromJson(element
            .data()); // สร้างออปเจกต์ของคลาส ผู้ใช้งาน แล้ว แปลงให้อยู่ในรูป Json formats
 
        // ไอดีของ user ที่อ่านบน doc firestore จะต้องไม่ตรงกับไอดีของผู้ใช้เอง ถึงจะเพิ่มเข้าไป ในลิสต์นี้ได้
        if (model.id != APIs.user.uid) {
          chatUserData.add(model);
        }
      });
 
      Future.delayed(Duration(seconds: 2));
      itemListOnSearch =
          chatUserData; // ข้อมูลในลิสต์ของผู้ใช้ที่ทำการค้นหาต้องตรงกับลิสต์ของผู้ใช้ที่ตรวจสอบแล้ว
      setState(() {});
    });
  }
 
  // Fetch data from Firestore
  void fetchData(String collection, String field, List<String> listToUpdate) { // ใช้คำสั่งนี้เมื่อต้องการดึงข้อมูลออกมาแสดงผล
    FirebaseFirestore.instance
        .collection(collection)
        .get()
        .then((querySnapshot) {
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
 
  // void _queryUsersBySchools() {
  //   final usersQuery = FirebaseFirestore.instance
  //       .collection('users')
  //       .where('schools', arrayContainsAny: selectedSchools);
 
  //   usersQuery.snapshots().listen((snapshot) {
  //     _usersStreamController.add(snapshot.docs);
  //   });
  // }
 
  //   void _queryUsersByUniversities() {
  //   final usersQuery = FirebaseFirestore.instance
  //       .collection('users')
  //       .where('universities', arrayContainsAny: selectedSchools);
 
  //   usersQuery.snapshots().listen((snapshot) {
  //     _usersStreamController.add(snapshot.docs);
  //   });
  // }
 
  //   void _queryUsersByEducationLevel() {
  //   final usersQuery = FirebaseFirestore.instance
  //       .collection('users')
  //       .where('educationLevel', arrayContainsAny: selectedSchools);
 
  //   usersQuery.snapshots().listen((snapshot) {
  //     _usersStreamController.add(snapshot.docs);
  //   });
  // }
 
  void _queryUsersBySchools() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('schools', arrayContainsAny: selectedSchools);
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs); //  StreamController สำหรับอัพเดทผู้ใช้ที่เลือกผ่านตัวกรอง เพื่อใช้ส่งข้อมูลผู้ใช้ไปยัง SteamBuilder ในภายหลัง ดังนั้นโค้ดในส่วนการแสดงผลจะมีลิสต์ผู้ใช้ที่เลืออกผ่านตัวกรองสำหรับนำมาแสดงผลจากตรงนี้
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersBySchools: $e');
  }
}
 
void _queryUsersByUniversities() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('universities', arrayContainsAny: selectedUniversities);
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs);
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersByUniversities: $e');
  }
}
 
void _queryUsersByEducationLevel() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('educationLevel', arrayContainsAny: selectedEducationLevel);
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs);
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersByEducationLevel: $e');
  }
}
 
void _queryUsersBySkills() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('skills', arrayContainsAny: selectedSkills);
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs);
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersBySkills: $e');
  }
}
 
void _queryUsersByOccupation() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('occupation', arrayContainsAny: selectedOccupation);
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs);
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersByOccupation: $e');
  }
}
 
void _queryUsersByHobbies() {
  try {
    final usersQuery = FirebaseFirestore.instance
        .collection('users')
        .where('hobbies', arrayContainsAny: selectedHobbies); // ค้นหาดึงข้อม฿ลที่เลือกไว้จาก dropdown เตรียมไว้เพื่อนำไปแสดงผลต่อ
 
    usersQuery.snapshots().listen((snapshot) {
      _usersStreamController.add(snapshot.docs);
    });
  } catch (e) {
    // Handle the exception, e.g., show an error message or log the error
    print('Error in _queryUsersByHobbies: $e');
  }
}
 
  // Define your Firestore collection reference ????????? *********** use or not ?
  // final CollectionReference usersCollection =
  //     FirebaseFirestore.instance.collection('users');
 
 void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Filter Users"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text('Select Skills'),
              DropdownSearch<String>.multiSelection(
                key: _skillsDropdownKey,
                items: skills,//["University 1", "University 2", "University 3"], // Replace with your university data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedSkills = selectedItem as List<String>;
                    _queryUsersBySkills();
                  });
                },
                selectedItems: selectedSkills ,
              ),
              SizedBox(height: 20),
              Text('Select Occupation'),
              DropdownSearch<String>.multiSelection(
                key: _occupationDropdownKey,
                items: occupation,//["University 1", "University 2", "University 3"], // Replace with your university data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedOccupation = selectedItem as List<String>;
                    _queryUsersByOccupation();
                  });
                },
                selectedItems: selectedOccupation ,
              ),
              SizedBox(height: 20),
              Text('Select Hobbies '),
              DropdownSearch<String>.multiSelection(
                key: _hobbiesDropdownKey,
                items: hobbies,//["University 1", "University 2", "University 3"], // Replace with your university data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedHobbies = selectedItem as List<String>;
                    _queryUsersByHobbies();
                  });
                },
                selectedItems: selectedHobbies ,
              ),
               SizedBox(height: 20),
              Text('Select School'),
              DropdownSearch<String>.multiSelection(
                key: _schoolsDropdownKey,
                items: schools,//["School 1", "School 2", "School 3"], // Replace with your school data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedSchools = selectedItem;
                    _queryUsersBySchools();
                  });
                },
                selectedItems: selectedSchools,
              ),
              SizedBox(height: 20),
              Text('Select University'),
              DropdownSearch<String>.multiSelection(
                key: _universitiesDropdownKey,
                items: universities,//["University 1", "University 2", "University 3"], // Replace with your university data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedUniversities = selectedItem as List<String>;
                    _queryUsersByUniversities();
                  });
                },
                selectedItems: selectedUniversities ,
              ),
              SizedBox(height: 20),
              Text('Select Education Level'),
              DropdownSearch<String>.multiSelection(
                key: _educationLevelDropdownKey,
                items: educationLevel,//["University 1", "University 2", "University 3"], // Replace with your university data
                onChanged: (selectedItem) {
                  setState(() {
                    selectedEducationLevel = selectedItem as List<String>;
                    _queryUsersByEducationLevel();
                  });
                },
                selectedItems: selectedEducationLevel ,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                 // Apply the filter and update the user list
              _queryUsersBySchools();
              _queryUsersByUniversities();
              _queryUsersByEducationLevel(); // Call the appropriate filter method based on the selected filter options
              // _queryUsersBySkills();
              // _queryUsersByOccupation();
              // _queryUsersByHobbies();
                // Apply the filter and update the user list
                filterUsers();
                Navigator.of(context).pop();
              },
              child: Text('Apply Filter'),
            ),
          ],
        );
      },
    );
  }
 
// Function to apply filters based on selected values
  void filterUsers() {
    // Use the selected filter values (selectedSchool, selectedUniversity, selectedEducationLevel)
    // to filter your user data and update the filteredUsers list
    filteredUsers = chatUserData.where((user) { //เอาใช้ตอน return ค่า filterCard(user:filteredUsers)
      return user.schools == selectedSchools &&
          user.universities == selectedUniversities &&
          user.educationLevel == selectedEducationLevel &&
          user.skills == selectedSkills &&
          user.occupation == selectedOccupation &&
          user.hobbies == selectedHobbies
          ;
    }).toList();
 
    setState(() {});
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
 
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ContactScreen()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        //const Icon(CupertinoIcons.home),
 
        title: const Text('Home'),
 
        actions: [
          //profile button
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfileScreen(user: APIs.me)));
            },
            icon: const Icon(Icons.person_2_outlined),
          ),
        ],
      ),
 
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
 
                Center(
                  child: Text(
                    'User Result from Search n Filter',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade800,
                        fontSize: 23),
                  ),
                ),
 
                //new search bar with filter icon
                TextField(
                  onChanged: (value) {
                    setState(() {
                      itemListOnSearch = chatUserData.where((element) {
                        final skills = element.skills;
                        final query = value.toLowerCase();
                        return skills.any(
                            (skill) => skill.toLowerCase().contains(query));
                      }).toList();
                    });
                  },
                  controller: _valueContains,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Search',
 
                    //filter icon
                    suffixIcon: IconButton(
                      icon: Icon(
                          Icons.filter_alt), // Icon for your 'Filter' button
                      onPressed: () {
                        // Navigate to the 'MultiFilterScreen'
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           MultiFilterScreen(user: APIs.me)),
                        // );
                        showFilterDialog(context);
                      },
                    ),
                  ),
                ),
                        //testing filter        
                      //   TextField(
                      //   onChanged: (value) {
                      //     setState(() {
                      //       itemListOnSearch = filteredUsers.where((element) {
                      //         final skills = element.skills;
                      //         final query = value.toLowerCase();
                      //         return skills.any((skill) => skill.toLowerCase().contains(query));
                      //       }).toList();
                      //     });
                      //   },
                      //   // ... Rest of your code
                      // ),
                      //test
 
                // check if user is typing , the result will be shown in form of user's card
                if (itemListOnSearch.isNotEmpty)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return FilterUserCard(user: itemListOnSearch[index]);
                        //return HomeUserCard(user: itemListOnSearch[index]);
                      },
                      itemCount: itemListOnSearch.length,
                    ),
             
                  ),
 
                SizedBox(height: 10),
 
                // Recommend USer
 
                // Padding(
                //   padding: const EdgeInsets.only(left: 55.0),
                //   child: Text(
                //     'Recommend users',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600,
                //         color: Colors.blue.shade800,
                //         fontSize: 23),
                //   ),
                // ),
 
                // SizedBox(height: 5),
 
                // Padding(
                //   padding: const EdgeInsets.only(left: 55.0),
                //   child: Text(
                //     'swipe left or right to see other user',
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600,
                //         color: Colors.grey.shade600,
                //         fontSize: 17),
                //   ),
                // ),
 
                SizedBox(height: 5),
 
                // Flexible(
                //   child: StreamBuilder(
                //     stream: APIs.getMyUsersId(),
 
                //     //get id of only known users
                //     builder: (context, snapshot) {
                //       switch (snapshot.connectionState) {
                //         //if data is loading
                //         case ConnectionState.waiting:
                //         case ConnectionState.none:
                //           return const Center(
                //               child: CircularProgressIndicator());
 
                //         //if some or all data is loaded then show it
                //         case ConnectionState.active:
                //         case ConnectionState.done:
                //           return StreamBuilder(
                //             stream: APIs.getAllUsers(
                //                 snapshot.data?.docs.map((e) => e.id).toList() ??
                //                     []),
 
                //             //get only those user, who's ids are provided
                //             builder: (context, snapshot) {
                //               switch (snapshot.connectionState) {
                //                 //if data is loading
                //                 case ConnectionState.waiting:
                //                 case ConnectionState.none:
                //                 // return const Center(child: CircularProgressIndicator());
 
                //                 //if some or all data is loaded then show it
                //                 case ConnectionState.active:
                //                 case ConnectionState.done:
                //                   final data = snapshot.data?.docs;
                //                   _list = data
                //                           ?.map((e) =>
                //                               ChatUser.fromJson(e.data()))
                //                           .toList() ??
                //                       [];
 
                //                   if (_list.isNotEmpty) {
                //                     return Swiper(
                //                       itemBuilder:
                //                           (BuildContext context, int index) {
                //                         return HomeUserCard(
                //                           user: _list[index],
                //                         );
                //                       },
                //                       itemCount: _list.length,
                //                     );
                //                   } else {
                //                     return const Center(
                //                       child: Text('No Connections Found!',
                //                           style: TextStyle(fontSize: 20)),
                //                     );
                //                   }
                //               }
                //             },
                //           );
                //       }
                //     },
                //   ),
                // ),
                Text('applied filtered result'),
                // Create a StreamBuilder to display the filtered user data.
                // You can place this widget within your Column where you want to show the filtered users
                  Expanded(
                    child: StreamBuilder<List<QueryDocumentSnapshot>>(
                      stream: _usersStreamController.stream,
                      builder: (context, snapshot) {
                   
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('no filter apply', textAlign: TextAlign.center,);
                          //CircularProgressIndicator(); // Show a loading indicator
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No users found from filter dropdown.');
                        }
                       
                        // Show the filtered users
                        return Column(
                          children: snapshot.data!.map((doc) {
                            final user = doc.data() as Map<String, dynamic>;
                            final filteredUser = ChatUser.fromJson(user); // Convert the user data to a ChatUser object
                   
                            return
                            FilterUserCard(user: filteredUser); // Display the user using FilterUserCard
                          }).toList(),
                        );
                      },
                    ),
                  ),
 
              ],
            ),
          ),
        ], //children
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Contact',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}