# A Flutter Architecture ready for big projects

This project structure was made thinking in productivity and easy maintenance.

#### What it brings ?

1. Bloc pattern 
2. Provider package for dependency injection
3. RxDart to manage states 
4. Moor_Flutter, a SQLite ORM to work offline using a local database (similar to ROOM on Android Jetpack)
5. Helper for make HTTP requests using Dio
6. Helper for store data on device using Shared Preferences with a helper class
7. Custom classes for page transitions animated (fromLeft, from Top, fromBottom and fromRight)
8. Custom Widgets like Loading, CardView, ContainerCorner (with round corner shape), ContainerWithMargin default, Toast and other..
9. Centering global values like native Android: "strings" (to put all the strings values that will be used on the pages), dimens (to set the margin or fontSize default for buttons, containers, etc), theme (to set the color pallet of the theme) and the colors defaults.
10. Also, at "utils" folder we have a custom exception class