 
class ChatUser {
 
  //constructor and required parameters
  ChatUser({
    required this.image,
    required this.occupation,
    required this.createdAt,
    required this.educationLevel,
    required this.experience,
    required this.certification,
    required this.skills,
    required this.universities,
    required this.schools,
    required this.hobbies,
    required this.location,
    required this.lastActive,
    required this.isOnline,
    required this.id,
    required this.selfIntro,
    required this.email,
    required this.pushToken,
    required this.username,
    required this.starRatings,
    required this.sumRatings,
    required this.avgRatings,
    required this.resourcelinks,
    required this.featureVector,
  });
 
 
  //declare properties to store the user's attributes
  //late final  can be initialized after object creation but cannot be changed once set.
  late  String selfIntro;
  late  String username;
  late  String image;
  late  bool isOnline;
  late String pushToken;
  late String lastActive;
  late String id;
  late String email;
  late String createdAt;
  late List<String> occupation;
  late List<String> educationLevel;
  late List<String> experience;
  late List<String> certification;
  late List<String> skills;
  late List<String> universities;
  late List<String> schools;
  late List<String> hobbies;
  late List<String> resourcelinks;
  late String location;
  late double starRatings;
  late double sumRatings;
  late double avgRatings;
  late Map<String, int> featureVector;
  //  List<String> ratedByUsers; // Add this field for users who have rated the current user.
  // List<String> RecommendationScreen; // Add this field for recommended users.
 
 
  // It takes a Map<String, dynamic> as input.
  // It extracts values from the JSON map and assigns them to the corresponding properties of the ChatUser object.
 
 
  ChatUser.fromJson(Map<String, dynamic> json){
 
    image = json['image'];
    occupation = List.castFrom<dynamic, String>(json['occupation']);
    createdAt = json['created_at'];
 
    // Handle fields that can be either a String or List<dynamic>
 
    educationLevel = (json['educationLevel'] is List)
        ? (json['educationLevel'] as List).cast<String>()
        : <String>[json['educationLevel']];
       
    experience = (json['experience'] is List)
        ? (json['experience'] as List).cast<String>()
        : <String>[json['experience']];
       
    certification = (json['certification'] is List)
        ? (json['certification'] as List).cast<String>()
        : <String>[json['certification']];
       
    skills = (json['skills'] is List)
        ? (json['skills'] as List).cast<String>()
        : <String>[json['skills']];
   
    universities = (json['universities'] is List)
        ? (json['universities'] as List).cast<String>()
        : <String>[json['universities']];
   
    schools = (json['schools'] is List)
        ? (json['schools'] as List).cast<String>()
        : <String>[json['schools']];
   
    hobbies = (json['hobbies'] is List)
        ? (json['hobbies'] as List).cast<String>()
        : <String>[json['hobbies']];
 
    resourcelinks = (json['resourcelinks'] is List)
        ? (json['resourcelinks'] as List).cast<String>()
        : <String>[json['resourcelinks']];    
 
 
 
    location = json['location'];
    lastActive = json['last_active'];
    isOnline = json['is_online'];
    id = json['id'];
    selfIntro = json['selfIntro'];
    email = json['email'];
    username = json['username'];
    pushToken = json['push_token'];
   
 
    starRatings = (json['starRatings'] is Map<String, double>)
    ? (json['starRatings'] as Map<String, double>).values.reduce((a, b) => a + b)
    : 0.0;
 
sumRatings = (json['sumRatings'] is Map<String, double>)
    ? (json['sumRatings'] as Map<String, double>).values.reduce((a, b) => a + b)
    : 0.0;
 
avgRatings = (json['avgRatings'] is Map<String, double>)
    ? (json['avgRatings'] as Map<String, double>).values.reduce((a, b) => a + b) /
      (json['avgRatings'] as Map<String, double>).length
    : 0.0;
 
 
 
        featureVector = (json['featureVector'] is Map)
    ? (json['featureVector'] as Map<String, dynamic>).map<String, int>(
        (key, value) => MapEntry<String, int>(key, value as int),
      )
    : <String, int>{};
 
    // educationLevel = List.castFrom<dynamic, String>(json['educationLevel']);
   
    // educationLevel = (json['educationLevel'] as List<dynamic>).cast<String>();
 
    // experience = (json['experience'] as List<dynamic>).cast<String>();
 
    // certification = (json['certification'] as List<dynamic>).cast<String>();
 
    // skills = (json['skills'] as List<dynamic>).cast<String>();
 
    // universities = (json['universities'] as List<dynamic>).cast<String>();
 
    // schools = (json['schools'] as List<dynamic>).cast<String>();
 
    // hobbies = (json['hobbies'] as List<dynamic>).cast<String>();
  }
 
 
    //toJson Method:
    //This method is used to convert a ChatUser instance back into a JSON map.
    //It creates an empty map (_data) and populates it with the values from the ChatUser object's properties.
    //The resulting map can be easily serialized into a JSON string using a library like dart:convert.
 
   
   Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
   
    _data['image'] = image;
    _data['occupation'] = occupation;
    _data['created_at'] = createdAt;
    _data['educationLevel'] = educationLevel;
    _data['experience'] = experience;
    _data['certification'] = certification;
    _data['skills'] = skills;
    _data['universities'] = universities;
    _data['schools'] = schools;
    _data['hobbies'] = hobbies;
    _data['location'] = location;
    _data['last_active'] = lastActive;
    _data['is_online'] = isOnline;
    _data['id'] = id;
    _data['selfIntro'] = selfIntro;
    _data['email'] = email;
    _data['push_token'] = pushToken;
    _data['username'] = username;
    _data['resourcelinks'] = resourcelinks;
    _data['starRatings'] = starRatings;
    _data['sumRatings'] = sumRatings;
    _data['avgRatings'] = avgRatings;
    _data['featureVector'] = featureVector;
    return _data;
  }
 
  factory ChatUser.fromJsonMap(Map<String, dynamic> data) {
  return ChatUser(
    image: data['image'] ?? '',
    occupation: List<String>.from(data['occupation'] ?? []),
    createdAt: data['created_at'] ?? '',
    educationLevel: List<String>.from(data['educationLevel'] ?? []),
    experience: List<String>.from(data['experience'] ?? []),
    certification: List<String>.from(data['certification'] ?? []),
    skills: List<String>.from(data['skills'] ?? []),
    universities: List<String>.from(data['universities'] ?? []),
    schools: List<String>.from(data['schools'] ?? []),
    hobbies: List<String>.from(data['hobbies'] ?? []),
    location: data['location'] ?? '',
    lastActive: data['last_active'] ?? '',
    isOnline: data['is_online'] ?? false,
    id: data['id'] ?? '',
    selfIntro: data['selfIntro'] ?? '',
    email: data['email'] ?? '',
    pushToken: data['push_token'] ?? '',
    username: data['username'] ?? '',
 
    resourcelinks: List<String>.from(data['resourcelinks'] ?? []),
   
    featureVector: {
      'sumRatings': data['sumRatings'] ?? 0,
      'occupation': data['occupation'] ?? 0,
      'skills': data['skills'] ?? 0,
      'hobbies': data['hobbies'] ?? 0,
 
    },
   
    starRatings: data['starRatings'] ?? 0.0,
    sumRatings: data['sumRatings'] ?? 0.0,
    avgRatings: data['avgRatings'] ?? 0.0,
  );
}
 
}
 
 
// Example usage:
// Assuming you have JSON data in 'jsonMap'
 
 
// Parse JSON data into a ChatUser object : creates a ChatUser instance from a JSON map (jsonMap).
final ChatUser chatUser = ChatUser.fromJsonMap(jsonMap);
 
// Convert a ChatUser object to JSON : converts an instance of ChatUser back into a JSON map.
final Map<String, dynamic> jsonMap = chatUser.toJson();