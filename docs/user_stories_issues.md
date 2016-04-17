#User stories (with potential 'issues' below) - LeadSnap

##USERS

**As a user, I want to be able to sign in and out.**

devise or bcrypt/from scratch?

User model

**As a developer, I want to offer 3 user roles:** standard(regular caller or 'telethug'), manager(+ more control for management), and admin(1 or 2 'master users')

enum 'role'

**As an admin, I want to be able to approve sign-ups and delete registered users** (so only current employees can have an account)

https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in (devise approvable)

**As an admin, I want to be able to assign different roles to other users as needed.**

GUI interface to edit other users' roles, and maybe usernames, delete users entirely if they no longer work there.

##LEADS

**As an admin, I want to be able to add/delete/edit campaigns.**

Campaigns object - leads belong to it.

Campaigns default to available: true but can be 'turned off' if we are temporarily not working on a project but it has not ended yet.

**As an Admin, I want to be able to add leads to a campaign.**

Leads CRUD many leads will go into a 'campaign', should have a way to submit or upload an excel or other database or csv of ONLY relavant fields (contact info, account number, source code)

What fields does it need besides pertinent contact info? number of times dialed, date last dialed, source code, data flag (disconnected, kill) -or- should these things be associated objects?

**As a user, I want to be able to choose what campaign, and optionally what source code from that campaign I want to work on.**

UI for choosing what to work - from what's available

**As a user, once I've chosen what to work I want to be served up basic info on the next lead in the 'stack', and be able to mark it accordingly** (nothing/unreached, daytime only, disconnected phone, no, callback, sale, kill), then served another, and so on.

Mark leads disconnected

Mark leads daytime only

Mark leads killed

Mark 'no' with date and user

Mark sale with date and user

**As a user, I want to be able so see some basic stats on the leadbase for a particular campaign.**  Examples: # leads yet unreached, average # of times dialed through since campaign start, etc.

display basic info about the choices for available things to work

**As a manager or admin, I want to be able to search by name, phone, etc through the lead base and mark it accordingly** (in case customers call back in or otherwise inquire), or figure out quickly if its any user's callback.

search function / input form

search results / view leads based on search results

Edit leads accordingly / When you find the lead you want, edit it (disconnect, no, kill, sale, etc)

**As an admin, I want to be able to put leads that responded 'no' (at least, say 3 months ago) back in the rotation for a '2nd round'.**

Specifiy criteria and add matching leads back into the stack. Search for all leads that are marked 'no' more than 3 months ago, as an example.

Possibly keep their first 'no' info (user and date) but make them avavilable for dialing again.

**As an admin, I want to be able to export a list of all disconnects and kills at the end of a campaign.**

Export data -  Export pertinent information about any leads that have been marked disconnected, or killed.

**As a manager/admin, I want an extra GUI control panel of all the cool extra stuff I am allowed to do** (search leadbase, manage users, add leads, etc)

Manager / Admin dashboard & views - Best way to present these actions in a user-friendly format.  Manager/non-admin will be somewhat simpler.

##CALLBACKS

**As a user, I want to create, read, update, and delete callbacks (associated with a particular lead)**

Callback class - day/time and notes - user and lead

Callback CRUD - from lead view, create read update delete on same screen

**As a user, I want to see a profile/dashboard page with nutshell callback information.**

User dashboard screen - mainly callback information - other pertinent manager/admin stuff will go elsewhere and basic users are supposed to keep it simple.

**As a user, I want to be able to cycle through all my callbacks that were scheduled for follow up today or before, and update them as necessary** - none/unreached, sale, no, opt to delete the callback if they're simply dodging you for a long time, etc.

Cycle callbacks - Perhaps cycle through them, but definitely have a 'back to callbacks' button function if they arrived at this lead from their callback screen.  Cycling would have a 'next callback' that would be the next callback scheduled for today or before.

**As a user, only I (or a manager or admin) can create/read/update/delete my own callbacks.**

Authorization for callback info - Managers and admins should definitely have access to others' callbacks, maybe everyone should in case someone else needs to follow up with the callbacks for someone who is absent. MAYBE just leave it open to all users, have a way to get specifically to someone else's callbacks if they are absent?

##DATABASE

**As an admin (and/or also a developer?) I would like the data (additions, markings, flags, callbacks, the leadbase in general in its current state) to be backed up regularly.**

DB backup - probably daily at 12:30am or something - marked with the previous day/evening's activity though.

##EXTRAS or later maybes:

Fun Stats and metrics?

Secure payment information to be sent securely to clients' box offices?

Add and manage renewals and conversions (most valuable leads) with ways to allow more leads based on merit/sales?

Messaging system within the app to send work-related messages between users (or just one-way from admins/managers to any user)

Twillio to send SMS and mass text/email everyone for short-term announcements and reminders.
