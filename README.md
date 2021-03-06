# README

## Seeding

Seeding has been broken into multiple parts due to the large amount of data.
Also, this affords more control over the process.

To seed, enter the following commands (excluding the comments).
**Wait** until each command is finished executing before entering the next command.
```
rails db:migrate:reset
rails db:seed 01=yes // students, tutors, courses, lessons, subscriptions, reviews
rails db:seed 02=yes // posts
rails db:seed 03=yes // messages
rails db:seed images=yes // course images
rails db:seed resources=yes // lesson resources
```
For Heroku:
```
heroku pg:reset DATABASE
heroku run rails db:migrate
heroku run rails db:seed 01=yes // students, tutors, courses, lessons, subscriptions, reviews
heroku run rails db:seed 02=yes // posts
heroku run rails db:seed 03=yes // messages
heroku run rails db:seed images=yes // course images
heroku run rails db:seed resources=yes // lesson resources
```
Each seed command **except 01** can be run multiple times if the initial amount
is insufficient (e.g. not enough messages or resources). But beware of the
Heroku row limit. Lesson videos not seeded due to time limit on seed (takes too
long).

## To Fix
    
"**password resets**" test in test/integration/**password_resets_test**.rb
throws an error on line 43.

Line 43:
```
assert_template 'password_resets/edit'
```

The error:
```
expecting <"password_resets/edit"> but rendering with <[]>
```

## To Do

### UI Improvements

**Based on feedback after user test:**

- ~~Course/Lessons tabs not immediately obvious~~
  - ~~fix tabs to top of page while scrolling~~

- ~~Add ‘New Course’ button to navbar for tutors~~

- ~~Course content description should have a few sections (improve template for tutors)~~
  - ~~Language the course is in~~
  - ~~Features: 9 lessons, 24 downloadable resources, 78 students~~
  - ~~What will you learn from this course?~~
  - ~~Prerequisites to taking this course~~

- ~~Course image banner should also be present on course page, probably behind the course title~~
  - ~~in course edit page, add an example card to show off what the course’s card looks like during editing~~

- ~~Centralize pagination buttons on 'courses' and 'tutors' pages~~

- ~~Home Page~~
  - ~~New User (no account)~~
    - ~~should see the “Welcome” and search bar that are currently there~~
    - ~~should see a list of features of the website (immediately, without scrolling down)~~
      - ~~e.g. “Hundreds of Courses”, “Dozens of Experienced Tutors”, “One Course, One Price”~~
    - ~~rows of recommendations, to give them somewhere to start clicking and going~~
      - ~~e.g. Most Popular, New Courses, Guitar Courses, Popular Tutors~~
    - ~~it should be made obvious that they can scroll down~~
      - ~~either have the current image not take up the whole page, or add a large “down arrow” at the bottom~~
  - ~~Student (logged in)~~
    - ~~same as new user, except for two things:~~
      - ~~replace the list of features and the current search bar with “Welcome back, here’s where you left off”~~
      - ~~two more rows of recommendations: Your Courses; Recommended Courses for You~~
  - ~~Tutor (logged in)~~
    - ~~same as new user~~

- ~~Upon logging in, Student should be redirected to Home page, Tutor to their Profile page~~

- ~~Tutors Page~~
  - ~~each tutor's card should have the information that is currently on their
    course's page (tutor rating, number of students, etc)~~
  - ~~rows of different types of tutors~~
    - ~~e.g. Popular Tutors, Tutors Teaching Piano~~

- ~~Courses Page~~
  - ~~rows of recommendations, similar to Tutors Page~~
  - ~~individual course pages should have a two more rows:~~
    - ~~other courses by this tutor~~
    - ~~other courses similar to this course~~

- ~~Search field in Navbar~~
  - ~~blend in a bit more to differentiate from search bars on Home and Courses page~~
    - ~~maybe change background color of search field (more translucent?)~~
    - ~~or just remove it, since Home and Courses Page already have search bars~~

- ~~Add search button to search bar on user profile page~~

- ~~File Uploads~~
  - ~~grey out the “save changes” and “back” buttons, as well as disable all links~~
  - ~~check why adobe acrobat documents can’t be uploaded (type: ‘application/pdf’)~~

### Ajax/JSON Improvements

- ~~add autocomplete function to all search bars~~
- ~~update page without reload when clearing notifications~~
- ~~send/delete posts/messages without reloading page~~
- ~~switch between lessons in scrollmenu without reloading page~~
- ~~post/update/delete reviews without reloading page~~
- ~~sort courses on courses/tutors/profile page without reloading page~~
- ~~sort reviews on course pages without reloading page~~

### Features / Other Improvements

- ~~delete posts/messages~~
- ~~prevent tutor's posts/messages on their own course from counting towards their 'unread' count~~
- ~~sort student's and tutor's courses on their profile page~~
- ~~fix home page flash message (account activation, password reset)~~
- ~~add user names to posts/messages~~
- ~~add error messages for:~~ 
  - ~~course new/edit~~
  - ~~lesson new/edit~~
  - ~~review new/edit (on course page)~~
  - ~~password reset~~
 
- ~~direct upload~~ **_(modification to S3 bucket needed, see below)_**
- ~~prevent downloading~~ **_(some notes, see below)_**
- ~~check lesson video uploading issue on heroku~~
 
- ~~SSO services~~ **_(some notes, see below)_**
- ~~notification system for posts/messages~~
- ~~clickable tags~~
- ~~report function for tutors, to report other accounts that have re-uploaded their materials at a cheaper price~~
- ~~public/private accounts for students~~
- ~~payment system~~ **_(some notes, see below)_**

- ~~seed posts/messages~~
- ~~seed course images~~
- ~~seed lesson resources~~

#### Direct Upload

To enable direct upload to Amazon S3, go to: Your Bucket -> Permissions -> CORS configuration. Paste the following snippet in the editor and save the change.
```
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
<CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>Authorization</AllowedHeader>
</CORSRule>
<CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>PUT</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
</CORSRule>
</CORSConfiguration>
```

#### Download Prevention

Solution to prevent video downloads could be improved.
- Currently, 'download button' and 'right click & save as' methods disabled,
  **except** on Internet Explorer.
- If time permits, change it to a system where the video gets uploaded to
  youtube/vimeo and then embedded, both automatically.

#### SSO Services

- Google available as option during sign up and log in. Tested on heroku.
- Facebook not added as it requires a privacy policy.

#### Payment System
Enrolling for a course now redirects to Paypal, where the student logs in and
makes their payment to the tutor. Ideally, they should be able to pay without
having to leave Music Academy, but this requires a Paypal Pro account (costs
money). The system was not tested on heroku in full (right up until needing to
actually put money in), but it works perfectly using Paypal's provided sandbox
test accounts in development, so there is currently no reason to think it would
not work in production.

### File Uploading Restrictions
  - **Course Creation Image**: png, jpeg, gif
  - **Lesson Video**: mp4, wmv
  - **Lesson Resources**: pdf, png, jpeg, mpeg, x-mpeg, mp3, x-mp3, mpeg3, x-mpeg3, mpg, x-mpg, x-mpegaudio
