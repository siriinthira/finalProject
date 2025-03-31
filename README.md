# SkillsX
SkillsX is an app prototype that combines networking, knowledge-sharing, and personal growth into one seamless experience. 


# How it Works:

**1. Create a Profile:** Start by creating a personal profile that outlines your skills, interests, and background. The more detailed and up-to-date your profile is, the better you’ll connect with others who share similar or complementary expertise.

**2. Search and Connect:** Use the search function to find individuals who match your interests, skills, or career goals. You can easily send a message or start a conversation to explore potential collaboration opportunities or gain advice.

**3. Interact and Rate:** After engaging in a conversation or collaboration, rate the interaction using the star system. Your feedback helps others gauge the quality of connections, while also helping to build your own reputation in the community.

**4. Grow Your Network:** As you engage with others, skillsX recommends more potential connections based on the data from your interactions. This continuous cycle of connection and feedback ensures a rich, engaged community where people share and learn from each other.

**5. Update Your Profile:** Keep your profile up-to-date with your latest achievements, skills, or interests. This allows other users to see your growth and stay current on your expertise.

# Wireframe

# Mockup

<p>
  <img src = "https://github.com/user-attachments/assets/aab3aa23-a03f-4022-9cc7-a039c26ff024"/>
</p>

<p>
  <img src = "https://github.com/user-attachments/assets/ed34b7a6-5315-432d-8d4e-873fc693e316"/>
</p>

<p>
  <img src = "https://github.com/user-attachments/assets/493af292-76fd-4cdd-8092-09329f6a0286"/>
</p>

# Prototype
<p>
  <img src = "https://github.com/user-attachments/assets/d06abcf2-af98-464a-bf75-543fefe0bd2e"/>
</p>

# Use Case Diagram 
<p>
  <img src = "https://github.com/user-attachments/assets/e1640ef7-6656-4aad-b37c-65635a812e15"/>
</p>


# Software Architecture Design


<p align="center">
  <img src="https://github.com/user-attachments/assets/618a1832-dcb6-44d4-98ea-9b51fb79728c"/>
</p>



# Database Design

<p align="center">
   <img src="https://github.com/user-attachments/assets/91ae369e-a943-41cd-8b99-8eb1ed9c8e53"/>
</p>



# Architecture Pattern 

<p align="center">
   <strong><img src = "https://github.com/user-attachments/assets/36d485de-88d5-4c6d-8577-4750e7ab07b4"/></strong>
</p>


# MVVM (Model-View-ViewModel)

**API**: Centralized API handling and Firebase integration.


**Models**: Defines data structures like user, chat, and message models.


**ViewModels**: Encapsulates business logic and manages app state for features like authentication, 
<p>chat messaging, filters, recommendations, profiles, and user ratings.</p>


**Views**: UI screens categorized into features (e.g., chat, filters, profile, recommendations.


**Widgets**: Reusable UI components to ensure consistency and reduce duplication.


**Helpers**: Utility functions for validation, constants, and the recommendation engine logic (cosine similarity).


**Main Files**: firebase_options.dart for Firebase configuration and main.dart as the app’s entry point.






