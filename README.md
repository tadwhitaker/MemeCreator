# Meme Creator

Fetch structured data from a server asynchronously.

## Overview

Welcome to the Meme Creator app, where you’ll learn to fetch data from the internet to create panda memes.

To create a meme, you’ll load some images from a URL, which could take some time depending on the speed of your internet connection to the server. You’ll use an asynchronous request so that your app can keep doing other things in the background, like responding to user actions, while waiting for the images to load into the UI.

In this walkthrough, you’ll learn how asynchronous data fetching works, and how to use it when retrieving panda images and their corresponding data in JSON format.

## Tutorial

[View a tutorial on this sample.](doc://com.apple.documentation/tutorials/sample-apps/MemeCreator)

## Running the Sample Code Project

Before running this sample on a physical device, select a Development Team under the Signing & Capabilities section in the project editor.

This app is packed using the swift package manager.

The App directory houses:

Assets.xcassets: Images and JSON objects for storage.
LoadableImage: A child view that loads an image from the retrieved data.
MemeCreator: A parent view that loads LoadableImage views, establishes state for the view, and attaches all this to a body variable that can be passed around.
MemeCreatorApp: Entry point for the app, establishes global state and a body variable that contains the UI.
Panda: A simple file that establishes a Panda struct using the Codable protocol, contains the endpoint URL, stores in a 'sample' variable.
PandaCollectionFetcher: A class that uses the ObservableObject protocol that's called in MemeCreatorApp, fetches data using PandaCollection and the response data is stored in the MemeCreatorApp state in a 'fetcher' variable.*/