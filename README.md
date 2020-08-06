# Sopra Steria Expertise Test App: BeBEER.

Repository of the Expertise Test:
Create an iOS app that communicates with the BrewDog REST API (https://punkapi.com/documentation/v2), and recommends beers based on the food we’re having for lunch. For example, if we are having tacos today, we’d like to find the best beers to pair with tacos.

Key points:
- Architecture design -> MVVM
- Design patterns
- Code quality
- Responsive UI

## Main features
* The app communicates with the BrewDog REST API (https://punkapi.com/documentation/v2).
* The app downloads data with the beers associated with the food typed.
* The app stores the downloaded data localy if no data with same key is found.
* The app displays a list of beers related to food typed.
* The app allows beers to be filtered according to their ABV without launching a new REST Request.
* The app displays basic information about beers as well as complementary information.
* The app allows the user to view beers associated to food already searched offline. 

## The app is made up of three screens
### 1. Home Page:
This page features a search bar, name of the app and an onboarding.
Once the user searches some food a new page is launched.

<img src="https://i.imgur.com/Auj7Vj6.png" data-canonical-src="https://i.imgur.com/Auj7Vj6.png" width="200"  />

### 2. List Page:
This page features a list of beers related to the search, a cancel button that returns to the main page and a segmented controller picker to filter the ABV% either ascending or descending.

<img src="https://i.imgur.com/cs1Uzum.png" data-canonical-src="https://i.imgur.com/cs1Uzum.png" width="200" />
<img src="https://i.imgur.com/cs1Uzum.png" data-canonical-src="https://i.imgur.com/cs1Uzum.png" width="200" />

### 3. Beer Page:
This page features a detailed information of the selected beer. Users can view information related to: name, date of creation, ABV, IBU, description, tagline and brewer tip related to the beer. There is also the possibility to come back and search other beers without having to reload the list of beers.

<img src="https://i.imgur.com/jmXyXNT.png" data-canonical-src="https://i.imgur.com/jmXyXNT.png" width="200" />

### Aditional notes
* The swift code is commented.
* Usage of XCode 11 with swiftUI.
* MVVM arquitecture is used.
* At a UI standpoint the app features two main colors as well as white as an accent color. Aditionally the app follows Apple’s HIG. Responsive UI.
  - ![#F7C23E](https://via.placeholder.com/15/F7C23E/000000?text=+) `#F7C23E: Primary color, vivid color that emulates the beer color`
  - ![#533D7F](https://via.placeholder.com/15/533D7F/000000?text=+) `#533D7F: Secondary color, vivid color that is complementary to the primary color`
  - ![#D39C00](https://via.placeholder.com/15/D39C00/000000?text=+) `#D39C00: Variation color, variation of primary color`
