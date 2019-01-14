# Cashback
# install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install carthage
brew install carthage

# packages and libraries should all be in the repo
# if issues run the following command after you cd into the project folder

carthage update --platform ios --no-use-binaries --verbose


# why carthage over cocopods
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
