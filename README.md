# SkillsX
SkillsX is an app prototype that combines networking, knowledge-sharing, and personal growth into one seamless experience. 

🚀 **Project Goals**

These goals guide what the product aims to achieve in the market and for its users.

Foster meaningful professional and skill-based relationships

Build a community that helps users connect with people who truly align with their goals and values.

Bridge the mentorship gap for students and early-career professionals

Make it easy for emerging talent to connect with experienced mentors.

Create a trusted space for self-improvement and feedback

Support users in developing soft skills and self-awareness through peer feedback.

Enable continuous personal growth through skill tracking

Encourage users to keep profiles updated and reflect on their progress.

Differentiate from traditional networking apps

Provide real value through relevance, interaction quality, and discovery of non-mainstream skills.

Leverage AI (e.g., Cosine Similarity) to improve user experience

Use intelligent matching to surface meaningful connections without overwhelming the user.

# 🧑‍🤝‍🧑 How it Works:

**1. Create a Profile:** Start by creating a personal profile that outlines your skills, interests, and background. The more detailed and up-to-date your profile is, the better you’ll connect with others who share similar or complementary expertise.

**2. Search and Connect:** Use the search function to find individuals who match your interests, skills, or career goals. You can easily send a message or start a conversation to explore potential collaboration opportunities or gain advice.

**3. Interact and Rate:** After engaging in a conversation or collaboration, rate the interaction using the star system. Your feedback helps others gauge the quality of connections, while also helping to build your own reputation in the community.

**4. Grow Your Network:** As you engage with others, skillsX recommends more potential connections based on Cosine Similarity. 

**5. Update Your Profile:** Keep your profile up-to-date with your latest achievements, skills, or interests. This allows other users to see your growth and stay current on your expertise.

------------------------------------------------------------------------------------

# UX UI Design Process

# Empathize



<img src = "https://github.com/user-attachments/assets/30f38843-2236-42df-9434-54488f95939a"/>
<img src = "https://github.com/user-attachments/assets/e5d84689-6dda-4a43-bc9d-bd72b9ee5c6e"/>

# Define


<img src = "https://github.com/user-attachments/assets/f4f0e2ab-05d2-49f6-bbf6-f3d6600a3bda"/>
<img src = "https://github.com/user-attachments/assets/ae7369ae-53a7-449f-afd6-bbcf5ca86c83"/>
<img src = "https://github.com/user-attachments/assets/dc5ca83c-e8a3-485f-beb9-97ccaf51c61f"/>

# Ideate

<img src ="https://github.com/user-attachments/assets/7c2ddd79-d45a-4ff1-8c2b-0bb631fb763e"/>
<img src ="https://github.com/user-attachments/assets/f9ee2b50-ac47-48fe-8d4f-6edc4acda86e"/>


# User Persona

<img src = "https://github.com/user-attachments/assets/d52f161f-c767-41e0-93c2-a46a14533d00"/>

<img src = "https://github.com/user-attachments/assets/342c9eba-c21e-49eb-9e7f-b86cf7f3a41c"/>


# User Scenario

<img src = "https://github.com/user-attachments/assets/cfd086c8-b699-4aab-835b-a8310b328da1"/>

<img src = "https://github.com/user-attachments/assets/670bfced-3cdb-45bc-beba-1158f9338214"/>


# User Story

<img src = "https://github.com/user-attachments/assets/b5a48f99-c90a-4951-90cd-a1113d3f9d6c"/>
<img src = "https://github.com/user-attachments/assets/7e7fd6c6-1fd9-4309-af21-812abc95fd37"/>

<img src = "https://github.com/user-attachments/assets/7a6c0f04-bb0e-4e4f-ab57-e8aecd2515ef"/>
<img src = "https://github.com/user-attachments/assets/16e85615-6324-4847-8b98-6410da692cd1"/>

# User Journey & Pain Points

🧭 USER JOURNEYS

These journeys track the steps each persona takes while using SkillsX to reach their goals.

------------------------------------------------------------------------------------


# User Flow v1

# Wireframe v1

# Mockup v1
<p>
  <img src = "https://github.com/user-attachments/assets/aab3aa23-a03f-4022-9cc7-a039c26ff024"/>
</p>

<p>
  <img src = "https://github.com/user-attachments/assets/ed34b7a6-5315-432d-8d4e-873fc693e316"/>
</p>

<p>
  <img src = "https://github.com/user-attachments/assets/493af292-76fd-4cdd-8092-09329f6a0286"/>
</p>

# Prototype v1
<p>
  <img src = "https://github.com/user-attachments/assets/d06abcf2-af98-464a-bf75-543fefe0bd2e"/>
</p>

------------------------------------------------------------------------------------

# Usability Testing


------------------------------------------------------------------------------------


# User Flow v2

# Wireframe v2

# Mockup v2

# Prototype v2

--------------------------------------------------------------------------
# What I Learned

--------------------------------------------------------------------------

# Use Case Diagram 
<p>
  <img src = "https://github.com/user-attachments/assets/e1640ef7-6656-4aad-b37c-65635a812e15"/>
</p>

--------------------------------------------------------------------------
# Software Architecture Design


<p align="center">
  <img src="https://github.com/user-attachments/assets/618a1832-dcb6-44d4-98ea-9b51fb79728c"/>
</p>

--------------------------------------------------------------------------
# Database Design

<p align="center">
   <img src="https://github.com/user-attachments/assets/91ae369e-a943-41cd-8b99-8eb1ed9c8e53"/>
</p>

--------------------------------------------------------------------------
# Architecture Pattern 

<p align="center">
   <strong><img src = "https://github.com/user-attachments/assets/36d485de-88d5-4c6d-8577-4750e7ab07b4"/></strong>
</p>

-------------------------------------------------------------------------
# MVVM (Model-View-ViewModel)

**API**: Centralized API handling and Firebase integration.


**Models**: Defines data structures like user, chat, and message models.


**ViewModels**: Encapsulates business logic and manages app state for features like authentication, 
<p>chat messaging, filters, recommendations, profiles, and user ratings.</p>


**Views**: UI screens categorized into features (e.g., chat, filters, profile, recommendations.


**Widgets**: Reusable UI components to ensure consistency and reduce duplication.


**Helpers**: Utility functions for validation, constants, and the recommendation engine logic (cosine similarity).


**Main Files**: firebase_options.dart for Firebase configuration and main.dart as the app’s entry point.






