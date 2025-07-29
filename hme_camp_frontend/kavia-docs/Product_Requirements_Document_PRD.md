# Product Requirements Document (PRD)
## HME Camp Coordination Platform – Frontend (hme_camp_frontend)

### Version
1.0

### Overview
The HME Camp Coordination Platform is a web application designed for High Maintenance Entertainment (HME), a large Burning Man camp, to efficiently coordinate logistics, member management, accommodations, jobs, meals, finances, and shared events for over 85 members. Built with React, the front end provides a modern, responsive, festival-inspired dashboard interface that connects to a backend via REST APIs (backend implementation not included in scope).

This document defines the objectives, stakeholders, feature set, user stories, system and user requirements, UI/design constraints, and other considerations relevant to the successful delivery of the web application.

---

## 1. Objectives

- **Member Coordination:** Provide tools for onboarding, authenticating, and managing camp members, including their profiles, accommodations, and roles.
- **Logistics Management:** Centralize information and workflows for camp accommodations, job signups, meals, and calendar events.
- **Financial Tracking:** Enable transparent dues and budget management, with payment tracking and external payments via Venmo.
- **Communication and Notification:** Facilitate internal messaging, notifications, and status dashboards to keep all members informed.
- **Usability & Reusability:** Offer an intuitive, playful, and visually appealing user experience that can be adapted for other camps with similar requirements.

---

## 2. Feature List

1. **Member Signup & Access Control**
   - Invite/member onboarding flow (by invite or open signup)
   - Secure login/logout and basic authentication
   - Role-based access: admin, member, guest

2. **Profile Management**
   - Individual member profiles: name, camp status, contact info, crew/team, buddy/friend links
   - Option to edit/update profile details

3. **Accommodation Planning**
   - Visualization and management of accommodation assignments and types (tent, RV, shiftpod, etc.)
   - Track size/dimensions and amenities (power, AC, etc.)
   - Visual map or list of camp layout (if available)

4. **Attendance & Calendar**
   - Arrival and departure date entry; attendance summary by crew/subgroup
   - Shared events calendar with filtering by type (camp work, events, meals, etc.)

5. **Dues & Budget Tracker**
   - Dues summary and payment tracking per member
   - Itemized budget tracking (major supplies, shared expenses)
   - Venmo link and payment status integrations

6. **Job Management**
   - Job board for signup, creation, and messaging
   - Staffing status dashboard (who’s on which job, gaps, coverage visualization)
   - Notifications for changes/new jobs

7. **Meal Planning**
   - Meal and food sharing sign-up system
   - Meal event creation and notifications
   - Messaging for meal coordinators and participants

8. **Notifications & Dashboards**
   - In-app notifications and basic announcement support
   - Summarized dashboards for key modules (jobs, accommodations, dues, calendar events)

9. **Theming & Layout**
   - Responsive dashboard layout (modules in side nav; profile and notifications in top bar)
   - Modern, festival-inspired color palette and playful iconography

10. **Admin Features**
    - Member management (add/remove/invite members, view status)
    - Override and edit accommodations, jobs, and dues

---

## 3. User Roles & Permissions

### 3.1 Member
- Can view and update own profile, accommodations, jobs, meals, and dues
- Can view camp calendar and notifications
- Can sign up for jobs and meals

### 3.2 Admin
- All member permissions
- Can invite/manage other members
- Can edit/override all camp logistics and data

### 3.3 Guest
- Read-only access to select modules as configured by admin
- No profile or edit permissions

---

## 4. User Stories

### Membership & Onboarding
- As a new member, I want to receive an invitation so I can join the camp platform securely.
- As an admin, I want to invite or remove members to maintain camp roster integrity.

### Profile & Accommodation
- As a member, I want to enter my profile, select or request accommodation, and see where I’ll stay.
- As an admin, I want to assign and visualize all accommodations for space planning.

### Dues Management
- As a member, I want to see how much dues I owe, when due, and pay via Venmo or mark as paid.
- As an admin, I want to track payments, update budget items, and view a dashboard summary.

### Jobs & Volunteering
- As a member, I want to browse camp jobs, sign up, and receive reminders.
- As an admin, I want to create/edit jobs, assign members, and ensure all shifts are covered.

### Meal Planning
- As a member, I’d like to see what meals are planned, sign up to coordinate or participate, and message coordinators.
- As an admin, I want to oversee meal planning, ensure coverage, and communicate changes.

### Events & Calendar
- As a member, I want to see a calendar with all relevant events, filter by type, and export important dates.

### Notifications & Communication
- As any user, I want to receive timely notifications about jobs, dues, meals, and announcements.

---

## 5. Functional Requirements

### 5.1 User & Auth
- Secure member authentication and access per role
- Signup and invitation mechanisms (manual or invite-token via email)

### 5.2 Modules
- Profile: CRUD for user data; photo optional
- Accommodation: CRUD with attributes (type, size, status, amenities)
- Calendar: View/calendar entries (arrivals, departures, events)
- Dues/Budget: View status, link to Venmo, mark/pay dues, manage budget
- Jobs: CRUD for jobs, sign up/withdraw, messaging per assignment
- Meals: CRUD for meal events, signup for roles (chef, helper, eater)
- Notifications: Central display and in-context “badges” or alerts
- Dashboards: Summaries for each major module

### 5.3 UI/UX
- Responsive for mobile/tablet/desktop
- Playful, modern, readable, festival-inspired theme/colors
- Dashboard/side-nav layout with clear module separation
- Accessible color contrast and font sizes

### 5.4 Integrations
- Venmo: Link out to user’s payment page, show status on platform
- Future-ready for other payments/integrations (architecture consideration)

### 5.5 REST API
- All data module operations performed through RESTful API endpoints (to be provided by backend)
- JWT or session token authentication to backend

---

## 6. Non-Functional Requirements

- **Performance:** Must offer fast load times and snappy navigation, even with 100+ users/records.
- **Scalability:** Codebase should easily allow white-labeling/adaptation by other camps (branding, colors, etc.).
- **Accessibility:** Adhere to basic web accessibility principles (navigation, color, clarity).
- **Responsiveness:** Fully usable from mobile devices and tablets in event/field settings.
- **Reliability:** Graceful error handling and reconnection for backend/API failure.
- **Security:** All data operations require authenticated session; sensitive data (dues, profiles) never publicly exposed.
- **Maintainability:** Source should use standard React, CSS, and modular component structure (see `/src`).

---

## 7. Constraints

- **Platform:** React 18+ in the browser. (No heavy UI frameworks. Vanilla CSS, custom components only.)
- **APIs:** Assumes RESTful APIs provided by backend; no direct DB or non-REST integration at frontend.
- **Authentication Storage:** No sensitive credentials in frontend codebase; use environment variables for public API keys only.
- **Branding:** Theme and colors can be customized by configuration; default is playful “Burning Man”/festival vibe.
- **3rd-party Dependencies:** Use only minimal essential libraries; heavy UI kits (Material, Ant, Bootstrap) are excluded.
- **Hosting/Deployment:** Optimized for static site hosts or containerized deployments.

---

## 8. Significant Requirements & Architecture

- Environment variables: `REACT_APP_SUPABASE_URL`, `REACT_APP_SUPABASE_KEY` (see .env.example for sample usage)
- Integration with Supabase for authentication/data storage is assumed, but implementation/configuration is separate from this scope.
- CSS theming with variables in `src/App.css`.
- Main entry point: `src/App.js`, with theming toggle and module routing.
- Navigation: left sidebar for modules/features, top bar for notifications/profile, main area for primary content, dialogs for creation/edit.

---

## 9. Out of Scope

- Backend/API implementation (assumed to exist/provided as a dependency)
- Payment processing beyond Venmo “link out” (no direct transaction initiation)
- On-site/offline support (requires internet connection)
- Non-camp general public features

---

## 10. Future Considerations

- Plug-in/adapter model for reusability in other camps
- Modularization of all domains (jobs, meals, dues, etc.) for pluggable architecture
- Additional payment integrations (e.g., PayPal, Stripe)
- Integration with external event APIs (e.g., PlayaEvents, Google Calendar)
- Offline caching

---

## Appendix: Reference Resources

- [HME Camp Site](https://www.highmaintenanceent.com/) (if available)
- [React Documentation](https://react.dev/)
- [Supabase Documentation](https://supabase.com/docs)

---

**End of Product Requirements Document (PRD)**
