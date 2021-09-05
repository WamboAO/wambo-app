# Wambo

An e-commerce Saas.

## Getting Started
##### Flutter Icon Launcher
`flutter pub run flutter_launcher_icons:main` 
##### Flutter Splash
`flutter pub run flutter_native_splash:create`
##### Flutter generate code
`flutter pub run build_runner build --delete-conflicting-outputs`

## High-level usecases
#### Authentication
* [ ] App should check if user is Authenticated. If yes, it should return main feature. Else, an Authentication screen should be presented.
* [ ] Authentication should have social and email/password fields.
* [ ] If user is not logged in, he should have the option to login with facebook or with email. I case the user is not ready he can authicate later.
* [ ] If user is login and minized the app, It should refresh the user's token.
* [ ] If user is not login and minized the app, It should capture his authentication response and show the appropriate screen.
