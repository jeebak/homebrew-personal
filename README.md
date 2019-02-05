# JeeBak's Personal Home Brew Formulae

* https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
```
brew create https://github.com/wmutils/core/archive/v1.4.tar.gz
   
mv $(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/core.rb Formula/wmutils-core.rb

vim Formula/wmutils-core.rb # updating homepage, and Class name as necessary

brew install --interactive --verbose Formula/wmutils-core.rb
```
