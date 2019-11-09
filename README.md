# Everyday-iTunes

## Introduction

This is an iOS app for browsing top iTunes store content, which are top 50 songs, top 50 audiobooks and top 50 podcasts. 
Users can tap the content type on the tapbar. Then each page will display a list of 50 artworks. Each artwork contains an
image, a name and an artist name. All the components are developed programmatically. No use of storyboard or interface builder
and no use of 3rd party frameworks and libraries.

## Functionalities

### Basic features

The root view controller is a tab bar controller which holds three view controllers: music view controller, book view controller and podcast view controller. The three view controllers all contains a title label and a child table view controller. This table view controller can be reused to create top 50 list for each media type which avoids repeated code. Because the metadata have the same structure in each JSON file. So the procedure of parsing JSON and extracting the data I need can be done in one class. And the only different is the JSON url. Thus, I use the url string as the property of the table view controller class. The table view controller class overrid the tableview method to customize the table cells. The cell includes a image of the artworks on the left, a title of artwork name on the ght and the artist name as the subtitle. I used URLSession and URLSessionDownloadTask to asychronously request the JSON url to return the data we need.

### Enhancements

Using a default placeholder image before the url image was loaded. If no default image assigned the cell first, the cell's layout will change. I also use a cache to hold the images if the memory is limited. The row of index path is the key, the value is image. So when the current cell's image doesn't cached, we will download the image again. In addition, I add a refresh control to update the top 50 list, since the server will update the JSON data. So users can explore everyday changes of the itunes media.

## Supported device

The app is developed in Swift on Xcode 10.3. It is tested on iOS 12.4 simulator.


