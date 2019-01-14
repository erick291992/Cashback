# Cashback
# install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install carthage
brew install carthage

# packages and libraries should all be in the repo
# if issues run the following command after you cd into the project folder

carthage update --platform ios --no-use-binaries --verbose


# why carthage over cocopods
Carthage is decentralised, simple and ruthless dependency management for iOS
Carthage is purely written in Swift so iOS developers can understand the technology behind Carthage and probably write another tool using CarthageKit
Carthage is easy to integrate and easy to remove from the project if it doesn’t suit project needs.
Carthage won’t touch your Xcode settings or project files. It just downloads and builds the dependencies so you have proper control on what you are doing.
Carthage works great for the large or eclectic codebases because of its flexibility
Building and updating lib(s) are easier with Carthage.
Carthage can be easily integrated with Continuous Integration server.
Making Swift libraries Carthage compatible is easy.
Decentralised
Supports submodules
