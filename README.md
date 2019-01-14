# Cashback
# install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


# install carthage
brew install carthage

# packages and libraries should all be in the repo
# if issues run the following command after you cd into the project folder

carthage update --platform ios --no-use-binaries --verbose
