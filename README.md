
# Xafe

Xafe is a personal expense tracking app that helps users perfectly handle their personal finances
such as income and expenditure in the best possible way, it will also help the users to list their
expenses in different categories so that tracking them becomes easy with just a single click.
 
# Folder Structure 
This folder structure explains what goes into where, and help any new developer/testers easily navigate the project

### assets
The assets folder has 3 other sub-directories Fonts, Images, SVG's, and the each asset will be in it's respective folder.

#
# lib/apps
The apps folder houses each feature of the app and her respective folder that makes the feature function properly.
Each feature at maximum can be splitted into three (3) layers:
Note: Each layer naming convention is singular and their sub-folders are plural

1. ### Data layer
    The data layer communicates directly to the outside world i.e RestAPI, GraphQl, Firebase and Local storage.

    ##### Data sources
    Data sources are can be data coming from the API, or saved locally on the mobile app and this data will be exposed to the entity in the domain layer by model through the repository.  

    ##### Model
    Model are dart objects that mimics json response from the API, In most case they also have 2 methods [fromJson] & [toJson].
    Here goes json serialization and deserialization too.
    Model class will extend the Entity class

    ##### Repositories
    The repository class in the [Data layer] are implementation of the repository class in the [Domain Layer]. 
    Also trying and catching will be done here.

2. ### Domain layer 
    ##### Repositories
    Repositories in the domain layer are abstract classes and the repositories in **Data layer** will extends this repository class and logic will be implements respectively
    Each repository should have its' match in the use case.

    ##### Use cases
    Use cases are action that can be performed on the presentation layer [UI] either by the user or an automated process.
    A feature can have more than one use case following **SOLID** design pattern **S-** Single-responsibility Principle
    meaning one class per use cases. This will enable easy testing.

3. ### Presentation layer
    The application user interface. Screens and widgets. Presentation logic is here also if required. On this layer you can decide to use whatever state management patter works for you
    ##### **UI**
    - screens - 
    - Widgets - Widgets are components but particular to just a certain feature

    ##### **Logic**
    Presentation logic to format the data or failure retrived by the repository and prepare it as required by the UI and user device settings. State managment comes into play here i.e BLOC, flutter bloc, Provider, Riverpod e.t.c
    - Viewmodel - The view model classes are responsible for checking if state is busy or ideal, it also responsible checking for states like (Loading, has data, empty) or even error and match the respective widget that matches a state.
    - Notifiers
    - Helpers - Helpers are small functions that does specific thing on the presentation layer, specific to this feature.      

#
# **lib/core**
The core folder houses all service, permission handler, notification
## **Config**
Global 
- **DI** - Class for registering dependency injection.

## **Firebase**
- **Services**
    - Auth Service
    - Firestore Service
    - Storage Service
- **Utils**
## **Error**
An abstract Failure class will be created here and all other error class will extend from it
#
# **lib/src**
The src folder holds sub-folders that can be used generally by any feature in the app i.e (button...)

## **components**
Product reuseabale component i.e Buttons, Snackbar
## **res**
- Assets - Contains string values of assets used in the product.
- Theme - Product theme deginistiom
- Value - Product Values
