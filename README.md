# Marvel Showcase

iOS Application and frameworks that works with Marvel API written in Swift

This repository is based on an assignment for **Cafebazaar** interview.
Assignment asks the following:

- Using **storyboards** is not allowed but **NIB** files are ok.

So initial project has no storyboards (except for launchscreen) . Also this project contains no unnecessary codes, even  in **AppDelegate** file.


# Architecture

Although the architecture of this project is **MVC**, this project will keep SOLID principles in mind.

# Namespace

All structures separated by namespace. That means if there should be structure for showing **List** (with special structure and **NOT** just an array) of *Character*s form *Core* elements of *Entity*, for the sake of **self-descriptive-naming**, It should be named something like **CoreEntityCharactersList**, but with the namespace it will be like **Entity.Core.Character.List**.


# MarvelAPI Framework

Since the API is fully designed and documented by **Marvel™**, We separate all API related files and encapsulate them into separate framework.

# WebserviceHandler Framework

We Don't want to couple this project with third party libraries. So we implement our own *Webservice Handler framework*. This framework could be a wrapper around any third party framework we may add later.

More details coming soon...
