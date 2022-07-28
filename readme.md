#  Recipe App (SwiftUI) - ReadMe
## Installation Guide
1 - Make sure you have Cocoapods installed. (Installation and documentation -> https://cocoapods.org)
2 - Open terminal
2 - Change the directory to projects' directory
3 - Enter the following command: "pod install"

## Features
Read the list of recipes.
Read all stocks as a list, navigate to a single stock detail, delete, update the existing stocks and create new stock. 
Browse the existing recipes as displayed in the converted format.

--> Good to know: 
The system doesn't allow more than 1 stocks with the same id. So user should provide non-existing ID for new stock.


## Architecture
Model-View architecture has been used in the application's development. All the views bind themselves to their model. 
Views are consuming repositories to fetch data and responding user's interaction with data.

## Dependency Inversion
Resolver library, which is really good dependency injection library, has been used for providing dependencies to classes.
Some unit tests have been implemented to demonstrate how Resolver is being used in unit testing.

## Concurrency
Swift's new concurrency feature, widely known as "async/await" was used in the project. 

## Mock Server inside the App
Mock server implemented in the app, which acts like a remote server from App's perspective. This was necessary to send URL requests and also to make the app interactive for the user.
There's a small JSON file in the project where the MockServer reads the data when the app is initialized.
User can edit the contents of "RecipesServerData", but should be extremely careful to not break the JSON syntax. Otherwise, all the lists will be empty. 


