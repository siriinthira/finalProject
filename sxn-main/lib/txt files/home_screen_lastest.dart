import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../models/chat_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/contact_screen.dart';
import 'package:app/widgets/home_user_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/widgets/filter_user_card.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/screens/auth/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/script/filter_screens/multi_filter.dart';

//home screen -- where all available contacts are shown
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//-------------------           Part 1          ------------------------------------------------//

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

  //-------------------           Part 2          ------------------------------------------------//

  // for storing all users : Your list of ChatUser data
  List<ChatUser> _list = [];

  //SearchBar named '_valueContains'
  TextEditingController? _valueContains = TextEditingController();

  //SearchList aka my list of search item
  List<ChatUser> itemListOnSearch = [];

  // for storing all users chat data
  List<ChatUser> chatUserData = [];

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo(); //ดึงข้อมูลโทเคนของผู้ใช้ และ ตรวจสอบสถานะการเข้าใช้งาน
    readData(); //อ่านและดึงข้อมูลที่วิตเจ็ตจะใช้เพื่อประมวลผล

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

  // Define your Firestore collection reference ????????? *********** use or not ?
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

// // Create a variable to store the selected filter values
//   FilterOptions _filterOptions = FilterOptions();

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
                  height: 35,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MultiFilterScreen(user: APIs.me)),
                        );
                      },
                    ),
                  ),
                ),

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

                SizedBox(height: 55),

                // Recommend USer

                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Text(
                    'Recommend users',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade800,
                        fontSize: 23),
                  ),
                ),

                SizedBox(height: 8), 

                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Text(
                    'swipe left or right to see other user',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                        fontSize: 17),
                  ),
                ),

                SizedBox(height: 8),

                Flexible(
                  child: StreamBuilder(
                    stream: APIs.getMyUsersId(),

                    //get id of only known users
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        //if data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return const Center(
                              child: CircularProgressIndicator());

                        //if some or all data is loaded then show it
                        case ConnectionState.active:
                        case ConnectionState.done:
                          return StreamBuilder(
                            stream: APIs.getAllUsers(
                                snapshot.data?.docs.map((e) => e.id).toList() ??
                                    []),

                            //get only those user, who's ids are provided
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                //if data is loading
                                case ConnectionState.waiting:
                                case ConnectionState.none:
                                // return const Center(child: CircularProgressIndicator());

                                //if some or all data is loaded then show it
                                case ConnectionState.active:
                                case ConnectionState.done:
                                  final data = snapshot.data?.docs;
                                  _list = data
                                          ?.map((e) =>
                                              ChatUser.fromJson(e.data()))
                                          .toList() ??
                                      [];

                                  if (_list.isNotEmpty) {
                                    return Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return HomeUserCard(
                                          user: _list[index],
                                        );
                                      },
                                      itemCount: _list.length,
                                    );
                                  } else {
                                    return const Center(
                                      child: Text('No Connections Found!',
                                          style: TextStyle(fontSize: 20)),
                                    );
                                  }
                              }
                            },
                          );
                      }
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
