<img src="https://imgur.com/7uHKwJG.png">


# Flutter Storyboard

A Flutter based application to showcase your custom widgets in your app that helps in easy review of the design. 
Features of the Flutter Storyboard: 
1. Reduction in time of Review process.
2. Easy and fast Design-to-app process.
3. Verify how your widget will react to changing themes.
4. Copy the code of the widget for easy implementation [TODO].

## Project Structure

<img src = "https://imgur.com/xy8zvMJ.png"> 

Our project will consist of multiple screens, namely Screen 1, Screen 2 and so on (aptly named) and some Common UI Widget that will be shared across multiple screens. And under each screen, we will have the desired components that we need that make up that screen, namely Widget 1, Widget 2 (aptly named too). And each widget will have different states.


## Implementation looks like this:


<img src="https://imgur.com/NgW0tDk.png" >

## How to Work it?

### STEP 0
Install Flutter if you don't have it: [Flutter](https://flutter.dev/?gclid=Cj0KCQiArozwBRDOARIsAHo2s7uEijFDhKeKe2-cnkkXAp7r4cGAMAgkC6TzDDGtrCMTnXEnj0EaR9waAldHEALw_wcB) 

[Fork](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/) the repository and open the repository in Android Studio.

### STEP 1

You will see this project structure where you will mostly not be concerend with any of the directories except **widget_library**

<img src= "https://imgur.com/a3Mu93B.png">

### STEP 2

<img src ="https://imgur.com/PXoPJ7S.png">

You will place your widgets in the **Widget Library** directory. After placing all of your widgets there, in whatever order you wish, you have to edit the **widget_list_data.dart** file when you are done creating the Widgets you want in your app.
  

## Resources
Understand the working of Flutter Storyboard through the Medium article and try the app on the playstore. Just download and see the magic 🤗
1. Medium: <ARTICLE LINK>
2. Playstore: <APP LINK>
3. Web: http://bit.ly/flutterboard


## Installation For Web

Use this link to install web version of the Flutter Storyboard [Web](https://flutter.dev/docs/get-started/web)

```bash
flutter build web
```

### Flutter Web Look and Feel

<img src="https://imgur.com/PKKJnpA.png">
<img src="https://imgur.com/eJSfYLa.png">


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[BSD 2-Clause "Simplified" License](https://github.com/DhruvamSharma/Flutter-StoryBoard/blob/master/LICENSE)
