# SkillsX
SkillsX is an app prototype that combines networking, knowledge-sharing, and personal growth into one seamless experience. 

🚀 **Project Goals**

* Build a community that helps users connect with people who truly align with their goals and values.
  
* Foster meaningful professional and skill-based relationships

* Create a win-win deal for people to exchange their skills, knowledge, and experience based on their expertise. 

* Enable continuous personal growth through feedback and skill tracking.

* Encourage users to keep profiles updated, rate interaction quality and reflect on their progress.

# 🧑‍🤝‍🧑 How it Works:

**1. Create a Profile:** Start by creating a personal profile that outlines your skills, interests, and background. The more detailed and up-to-date your profile is, the better you’ll connect with others who share similar or complementary expertise.

**2. Search and Connect:** Use the search function to find individuals who match your interests, skills, or career goals. You can easily send a message or start a conversation to explore potential collaboration opportunities or gain advice.

**3. Interact and Rate:** After engaging in a conversation or collaboration, rate the interaction using the star system. Your feedback helps others gauge the quality of connections, while also helping to build your own reputation in the community.

**4. Grow Your Network:** As you engage with others, skillsX recommends more potential connections based on Cosine Similarity. 

**5. Update Your Profile:** Keep your profile up-to-date with your latest achievements, skills, or interests. This allows other users to see your growth and stay current on your expertise.

------------------------------------------------------------------------------------

# UX UI Design Process

# Empathize


<img src ="https://github.com/user-attachments/assets/d4606d91-2465-4256-9812-5ef00135b4f4"/>
<img src = "https://github.com/user-attachments/assets/3d7bc1f3-fb7c-41fc-b05c-dceec3903537"/>


# Define

<img src = "https://github.com/user-attachments/assets/5c6745d6-ba96-4549-a1a8-adffa9efba16"/>
<img src = "https://github.com/user-attachments/assets/9e51725e-616c-4db2-924b-06ea22cb3483"/>
<img src = "https://github.com/user-attachments/assets/71d8b909-c166-4cce-8baa-480130a8ed14"/>


# Ideate
<img src = "https://github.com/user-attachments/assets/f178b5f0-f8ae-4570-91b4-895273b29a43"/>
<img src ="https://github.com/user-attachments/assets/5e5ac5c7-f0a5-4ad3-b30b-c4cf8cecdc34"/>



# User Persona

<img src = "https://github.com/user-attachments/assets/d52f161f-c767-41e0-93c2-a46a14533d00"/>

<img src = "https://github.com/user-attachments/assets/342c9eba-c21e-49eb-9e7f-b86cf7f3a41c"/>


# User Scenario

<img src = "https://github.com/user-attachments/assets/cfd086c8-b699-4aab-835b-a8310b328da1"/>

<img src = "https://github.com/user-attachments/assets/670bfced-3cdb-45bc-beba-1158f9338214"/>


# User Story

<img src = "https://github.com/user-attachments/assets/311a039c-b9db-47d5-ae73-898dddb63c98"/>
<img src = "https://github.com/user-attachments/assets/25d006ea-02a4-4590-af4d-33c19680a798"/>


# Journey Map & Pain Points

🧭 USER JOURNEYS

These journeys track the steps each persona takes while using SkillsX to reach their goals.

------------------------------------------------------------------------------------

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


# User Flow v2

# Wireframe v2

# Mockup v2

# Prototype v2

------------------------------------------------------------------------------------

# Usability Testing

User Story
As a freelance creative strategist and digital marketer, I want to quickly assess whether potential collaborators and projects align with my storytelling approach and quality standards, 
so that I can invest my time in meaningful work and continue building my professional reputation as both a mentor and creator.

Acceptance Criteria:

- I can view collaborators’ portfolios, experience, and testimonials before reaching out or accepting invitations.

- I can filter out low-quality or misaligned projects based on budget, tone, or creative freedom.

- I can clearly showcase my marketing philosophy, campaigns, and mentorship work on my profile.

- I can share tips or insights and receive feedback from the creative community or mentees.

- I can track communication and collaboration history to identify reliable long-term partners.



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






