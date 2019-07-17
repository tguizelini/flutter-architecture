# A Flutter Architecture ready for big projects

This project structure was made thinking in productivity and easy maintenance.

#### What it brings ?

1. Bloc pattern (business layer)

2. Provider package for dependency injection

3. RxDart to manage states 

4. Moor_Flutter, a SQLite ORM to work offline using a local database (similar to ROOM on Android Jetpack)

5. Helper for make HTTP requests using Dio

6. Helper for store data on device using Shared Preferences with a helper class

7. Custom classes for page transitions animated (fromLeft, from Top, fromBottom and fromRight)

8. Custom Widgets like Loading, CardView, ContainerCorner (with round corner shape), Toast, Snackbar, Modal, Dropdown, CustomDrawer and others.

9. at "values", you se the files "dimens" (to set sizes default - margin, font, etc. "theme" (to set the color pallet) and "colors" defaults. 

10. Also, at "utils" folder we have a custom exception class