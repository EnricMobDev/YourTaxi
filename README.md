# YourTaxi App

This application contains a tabBar with two buttons.
The first button is a taxi list in Hamburg with a little map, number of license and type of car for each cell.
The second button is a Map with all of these taxis, this map update the coordinates each time when the user moves the map and fetch all taxis again with the new coordinates.

Architecture:
I used MVVM + Builder patter to inject dependencies.
The viewModels usually use ObservableObject (Combine) for update the data in a reactive way.

Code Details:
The code is in SWiftUI because is our future language.
I use Binding Objects for share data between views and State for that binding variables.
Use Combine for fetching the taxis and for doing ViewModels reactive , and Notifications for share data when the user moves the map and I need to update the coordinates for fetching with the news coordinates.
This app is localized with English and Spanish

Unit test:
I have 94% of coverage.
Include unitTest with manual Mocks
Include UITest
The part of the test is very easy because there isn't a lot of logic and the UITest the same the views are very basics.

