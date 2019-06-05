# A Flutter Architecture ready for big projects

This project structure was made thinking in productivity and easy maintenance.

#### Libraries

1. Bloc pattern with dependency injection
2. RxDart for reactive apps
3. Helper for make HTTP requests using Dio
4. Helper for store data on device using Shared Preferences with a helper class
5. Custom classes for page transitions animated (fromLeft, from Top, fromBottom and fromRight)
6. Custom Widgets like Loading, CardView, ContainerCorner (with round corner shape), ContainerWithMargin default, Toast and other..
7. Centering global values like native Android: "strings" (to put all the strings values that will be used on the pages), dimens (to set the margin or fontSize default for buttons, containers, etc), theme (to set the color pallet of the theme) and the colors defaults.
8. Also, at "utils" folder we have a custom class to decode JWT Tokens based on base64
