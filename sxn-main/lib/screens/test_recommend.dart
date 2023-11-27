import 'dart:math';
import 'package:app/api/apis.dart';
import 'package:flutter/material.dart';
import 'package:app/models/chat_user.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/widgets/swiper_user_card.dart';


// ver 2

class TestRecommend extends StatefulWidget {
  @override
  State<TestRecommend> createState() => _TestRecommendState();
}
 
class _TestRecommendState extends State<TestRecommend> {
  List<ChatUser> _list = [];
 
  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }
 
 double cosineSimilarity(List<double> vectorA, List<double> vectorB) {
  double dotProduct = 0;
  double normA = 0;
  double normB = 0;

  for (int i = 0; i < vectorA.length; i++) {
    dotProduct += vectorA[i] * vectorB[i];
    normA += vectorA[i] * vectorA[i];
    normB += vectorB[i] * vectorB[i];
  }

  return dotProduct / (sqrt(normA) * sqrt(normB));
}

  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Recommend'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen(user: APIs.me)),
              );
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
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Text(
                    'Recommend users:\n high ratings',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade800,
                      fontSize: 23,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: Text(
                    'swipe left or right to see other users',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 5),
               Flexible(
  child: StreamBuilder(
    stream: APIs.getMyUsersId(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          return const Center(child: CircularProgressIndicator());
        case ConnectionState.active:
        case ConnectionState.done:
          return StreamBuilder(
            stream: APIs.getAllUsers(
              snapshot.data?.docs.map((e) => e.id).toList() ?? [],
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error fetching users'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No users found'));
              }

              final data = snapshot.data!.docs;
              _list = data.map((e) => ChatUser.fromJson(e.data())).toList();

              final currentUser = APIs.me;
              final currentUserVector = [currentUser.starRatings.toDouble()]; // Convert to a list

              _list.sort((a, b) {
                final userAVector = [a.starRatings.toDouble()]; // Convert to a list
                final userBVector = [b.starRatings.toDouble()]; // Convert to a list

                final similarityA = cosineSimilarity(currentUserVector, userAVector);
                final similarityB = cosineSimilarity(currentUserVector, userBVector);

                return similarityB.compareTo(similarityA);
              });
              final midIndex = (_list.length / 2).toInt();
              final topUsers = _list.sublist(0, midIndex + 1);

              if (topUsers.isNotEmpty) {
                return Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return SwiperUserCard(
                      user: topUsers[index],
                    );
                  },
                  itemCount: topUsers.length,
                );
              } else {
                return const Center(
                  child: Text('No Connections Found!', style: TextStyle(fontSize: 20)),
                );
              }
            },
          );
      }
    },
  ),
),  
],),),],),);
  }}