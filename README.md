# SkillsX
SkillsX is an app prototype that combines networking, knowledge-sharing, and personal growth into one seamless experience. 


# 🧑‍🤝‍🧑 How it Works:

**1. Create a Profile:** Start by creating a personal profile that outlines your skills, interests, and background. The more detailed and up-to-date your profile is, the better you’ll connect with others who share similar or complementary expertise.

**2. Search and Connect:** Use the search function to find individuals who match your interests, skills, or career goals. You can easily send a message or start a conversation to explore potential collaboration opportunities or gain advice.

**3. Interact and Rate:** After engaging in a conversation or collaboration, rate the interaction using the star system. Your feedback helps others gauge the quality of connections, while also helping to build your own reputation in the community.

**4. Grow Your Network:** As you engage with others, skillsX recommends more potential connections based on Cosine Similarity. 

**5. Update Your Profile:** Keep your profile up-to-date with your latest achievements, skills, or interests. This allows other users to see your growth and stay current on your expertise.

------------------------------------------------------------------------------------

# UX UI Design Process

# Empathize

🎯 **Target Users**

SkillsX is designed for a diverse but focused user base that includes:

**Young Professionals** – Seeking to build their network and grow skillsets.

**Students & Recent Graduates** – Eager to find mentors, gain career insight, or connect with peers in similar learning journeys.

**Lifelong Learners & Hobbyists** – Passionate about self-improvement and knowledge-sharing.

🔍 **Key Insights from User Research**

Based on preliminary interviews, surveys, and behavioral analysis, we uncovered the following insights:

Users crave meaningful connections, not just more connections. They prefer relevance over volume.

Reputation matters — users want to know who they're connecting with and whether someone is reliable or credible.

Time is valuable — users want a frictionless way to assess whether someone is worth connecting with.

Skill visibility is underutilized — users often have side skills or interests that don’t fit neatly into LinkedIn-like platforms.

People want feedback — rating systems and constructive input were seen as ways to validate and improve one’s communication or collaboration skills.

🔌 **APIs**

To support the seamless functionality of SkillsX, several key APIs can be leveraged:

Authentication (OAuth2 / Firebase Auth) – For secure sign-in using Google, LinkedIn, or email.

Natural Language Processing (NLP APIs) – Used to analyze profile content and calculate Cosine Similarity between users’ interests, skills, and bios.

Messaging API (e.g., Sendbird, Twilio, Firebase Realtime Database) – Enables real-time chat between users.

Rating System Backend – A lightweight backend API (Node.js/Express or Firebase Functions) to collect and display star ratings for each user interaction.

Recommendation Engine (Custom / Machine Learning API) – Suggests potential connections based on similarity scoring and past user behavior.

Profile Management (CRUD API) – Allows users to update, store, and retrieve profile data dynamically.



# Define

✅ Define

💡 **Problem Statements**

Young Professionals need a way to form meaningful and relevant professional connections, because current platforms prioritize volume over quality.

Students & Graduates need to discover trustworthy mentors and showcase their emerging skillsets, because they often feel overshadowed or invisible in traditional networks.

Lifelong Learners & Hobbyists need a platform to share and discover niche skills, because mainstream platforms don’t surface these well.

All users need a quick way to evaluate potential connections based on reputation and skill relevance, because their time is limited and precious.

Users need a mechanism for constructive feedback and validation, to help them improve communication and collaboration in a safe environment.

🧠 **User Needs**

Authentic, high-signal networking.

Credible, transparent reputation systems.

Lightweight profiles that highlight skills beyond job titles.

A fast “connection value preview” before engaging.

Space for community-driven feedback and ratings.

# User Persona
<img src = "https://github.com/user-attachments/assets/c525c2f2-c158-4dd6-8d87-c60c0e0c293c"/>

<img src = "https://github.com/user-attachments/assets/d9c84047-b508-4ce7-80b9-40818cdd4a54"/>


# User Scenario

# User Journey & Pain Points

# User Story

------------------------------------------------------------------------------------


# Ideate

🎨 **UI/UX Feature Concepts**

**1. Skill Cards with Layers**
Interactive, modular "skill cards" that show core skills and expandable “side skills.”

Color-coded or tag-based for quick scanning.

Let users endorse or comment with context (e.g., "Great at breaking down complex ideas!").

**2. Connection Quality Score**
A “signal strength” metric based on mutual interests, shared goals, and interaction quality.

Not based on how many people they know — but how aligned they are with you.

**3. Reputation Badges & Community Ratings**
Badges earned through peer reviews, mentorship activity, or verified projects.

Community can give feedback on helpfulness, communication, reliability, etc.

**4. Swipe-to-Scan Networking**
Like a Tinder for skills — users can swipe through profiles or micro-stories based on interest and alignment.

Preview core skills, mutual goals, and last activity.

CTA: "Request a 15-min chat" or "Follow for content"

**5. Feedback Loop UI**
After collaborations or chats, prompt both users to leave a short review.

Ratings go into private growth analytics and public reputation.

**6. Skill Story Feature**
Let users share 1-2 minute stories on how they learned a skill, what they built, or how they helped someone.

Builds authenticity and connects over experience rather than titles.

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






