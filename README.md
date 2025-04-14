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

🎯 **Design Goals (UX/UI-Focused)**

These are focused on creating a smooth, intuitive, and meaningful user experience.

Create a frictionless networking experience

Enable users to find and connect with relevant people effortlessly.

Design transparent and intuitive reputation feedback

Build a rating system that feels fair, useful, and promotes trust.

Highlight skill depth and diversity beyond job titles

Allow users to showcase niche and side skills through modern profile components (e.g., skill cards, skill stories).

Deliver fast, context-aware connection previews

Use smart visuals (badges, tags, relevance scores) to help users assess connection value at a glance.

Promote authentic interactions, not just quantity

Prioritize design patterns that encourage meaningful messages and collaboration over shallow networking.

Make the platform visually engaging but lightweight

Use clean UI and personalization features (e.g., dark mode, layout preferences) to enhance usability.





# User Persona

<img src = "https://github.com/user-attachments/assets/d52f161f-c767-41e0-93c2-a46a14533d00"/>

<img src = "https://github.com/user-attachments/assets/342c9eba-c21e-49eb-9e7f-b86cf7f3a41c"/>


# User Scenario

🧩 **User Scenario: Korn’s Use of SkillsX**

Context:

Korn is prepping a digital campaign for a travel brand and wants to collaborate with a designer who understands cultural nuance and modern design. He also wants to mentor upcoming marketers and build his personal brand beyond Instagram.

Journey on SkillsX:

Discovery: Korn logs into SkillsX and uses the “Swipe-to-Scan” feature to explore collaborators with shared creative interests and complementary skills.

Matching: He sees Natthida’s profile — her Thai-modern visual style aligns with his campaign’s vibe. Her profile includes a Skill Story video where she breaks down her creative process for a past campaign.

Quick Check: He taps on her Skill Card, which reveals tags like “Brand Identity,” “Cultural Design,” and “Digital Illustration,” along with endorsements and a ⭐ 4.8 collaboration rating.

Connect: He uses the “Request a 15-min Chat” button to set up a virtual coffee.

Post-Collab: After collaborating on the campaign, Korn and Natthida exchange feedback through the platform, boosting each other’s reputation badges.

Outcome:

Korn finds a reliable design partner and earns credibility points as a collaborator and mentor. He later shares a Skill Story about the campaign success, attracting more relevant connection requests.

🧩 **User Scenario: Natthida’s Use of SkillsX**

Context:

Natthida is looking to break out of her current circle and work with more clients who understand the value of cultural storytelling. She’s also curious about mentoring juniors and learning more about digital marketing strategies.

Journey on SkillsX:

Profile Setup: Natthida builds a dynamic profile with a visual portfolio slider, embedded Skill Stories, and selects interest tags like “Cultural Branding” and “Creative Collaboration.”

Exploration: She browses the “Skill Visibility” feed, where short clips and posts from professionals like Korn appear. She finds his post on campaign storytelling insightful and follows him.

Connection: Korn reaches out for a collab. She reviews his Connection Quality Score, mutual interests, and reads positive peer feedback. She accepts the chat.

Growth: After the project, she receives a detailed review of her communication and visual delivery. She earns a “Collaborator Plus” badge and gets invited to a feedback circle with other creatives.

Reflection: Inspired by the experience, she posts her own Skill Story — "Blending Tradition with Trend: My Design Philosophy" — which gets positive engagement and leads to more interest from aligned collaborators.

Outcome:

Natthida elevates her visibility, builds cross-disciplinary connections, and enhances her credibility — all while staying true to her creative values.


# User Journey & Pain Points

🧭 USER JOURNEYS

These journeys track the steps each persona takes while using SkillsX to reach their goals.

# User Story

🧑‍💼 User Story – Korn Rattanapong

As a freelance digital marketer,
I want to find credible and creatively aligned collaborators,
So that I can execute campaigns that reflect my storytelling values while building my reputation as a mentor and strategist.

As a mentor, I want to share actionable advice and receive feedback, so I can improve how I support junior marketers.

As a freelancer, I want to quickly assess someone’s reliability and skill match before collaborating, so I can save time and avoid mismatches.

As a creative professional, I want to highlight both my work and my side interests (like photography), so I can build authentic connections beyond just my job title.

As a networker, I want to be part of a community that values meaningful interaction over follower counts or likes.


🎨 User Story – Natthida Kanchana

As a graphic designer blending Thai tradition with modern design,
I want to showcase my unique design philosophy and find collaborators who value cultural expression,
So that I can work on more fulfilling projects and grow my creative influence.

As a designer, I want to present my portfolio in a visually engaging way, so my unique style and influences stand out.

As a creative professional, I want to connect with marketers who appreciate cultural nuance, so that the projects I work on feel aligned with my identity.

As an emerging talent, I want to get constructive feedback on my work and communication, so I can grow professionally and confidently.

As a freelancer, I want a platform that helps me filter out low-quality or misaligned projects early in the process.



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






