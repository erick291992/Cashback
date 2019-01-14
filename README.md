# Cashback
# install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install carthage
brew install carthage

# packages and libraries should all be in the repo
# if issues run the following command after you cd into the project folder

carthage update --platform ios --no-use-binaries --verbose


# why carthage over cocopods
# benifits of carthage
1. Carthage is decentralised, simple and ruthless dependency management for iOS
2. Carthage is purely written in Swift so iOS developers can understand the technology behind Carthage and probably write another tool using CarthageKit
3. Carthage is easy to integrate and easy to remove from the project if it doesn’t suit project needs.
4. Carthage won’t touch your Xcode settings or project files. It just downloads and builds the dependencies so you have proper control on what you are doing.
5. Carthage works great for the large or eclectic codebases because of its flexibility
6. Building and updating lib(s) are easier with Carthage.
7. Carthage can be easily integrated with Continuous Integration server.
8. Making Swift libraries Carthage compatible is easy.
9. Decentralised
10. Supports submodules

# cons of cocopods

1. It requires knowledge of another programming language i.e Ruby on which CocoaPods is built.
2. Hard to integrate when already using Xcode workspace.
3. Hard to remove once integrated.
CocoaPods takes controls of entire Xcode project and if something fails entire project stops building. The fixing the errors thrown by CocoaPods are the hard and time-consuming task and requires an understanding of what CocoaPods changed inside the iOS project.
4. Pods force your project into a specific structure. CocoaPods updating Xcode Projects and Files is like magic without understanding what’s changed. It works in a black box way.
5. Integrating with Continuous Integration Server is hard as we have to install and manage Ruby libraries. All the dependency needs to be installed and built for every build Or we have to check in the entire third-party dependencies inside the project. 6. Caching mechanism doesn’t always give clean results.
6. The building of iOS app became an intransparent and slow process.
7. Building libraries and frameworks that support CocoaPods became such a pain for iOS developers who are not skilled in Ruby. 9. The developer needs to write .podspec file and follow many unrelated Ruby conventions.
10. Centralised
11. Can’t work with framework and project at the same time because of the two-step process for working on dependencies.


# link to source of pros and cons
https://medium.com/xcblog/carthage-or-cocoapods-that-is-the-question-1074edaafbcb
