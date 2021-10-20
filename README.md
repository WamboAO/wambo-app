# Wambo

An e-commerce Saas.

## Getting Started
##### Flutter Icon Launcher
`flutter pub run flutter_launcher_icons:main` 
##### Flutter Splash
`flutter pub run flutter_native_splash:create`
##### Flutter generate code
`flutter pub run build_runner build --delete-conflicting-outputs`
##### Flutter build
once you changed package version run: 
`flutter build apk`
##### Login with Facebook need to include strings.xml
```<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="facebook_app_id">YOUR_APP_ID</string>
    <string name="fb_login_protocol_scheme">YOUR_FB_APP_ID</string>
    <string name="app_name">YOUR_APP_NAME</string>

</resources>
```
## High-level usecases
#### Authentication
* [X] App should check if user is Authenticated. If yes, it should return main feature. Else, an Authentication screen should be presented.
* [X] Authentication should have social and email/password fields.
* [X] If user is not logged in, he should have the option to login with facebook or with email. I case the user is not ready he can authicate later.
* [X] If user is login and minized the app, It should refresh the user's token.
* [x] If user is not login and minized the app, It should capture his authentication response and show the appropriate screen.

#### Firebase Tools
* [ ] Implementation of google analytics 
* [ ] Implementation of crash analytics
* [ ] Implementation of dynamic links
* [ ] Implmentation of firebase core
* [ ] Implementation of notifications
