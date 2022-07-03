# Run all upgrades
all: update

# Install + Update
install: install-only update

# Update all softwares & package installers
update: update-brew update-port update-pip update-npm update-yarn update-clitools clean-update update-flutter

# Install all package installers and essential softwares
install-only: install-clitools install-brew install-port install-npm install-yarn install-rust install-clitools install-casks install-pod clean-install

# Cleaning cache and other generated files while install
clean-install: clean-install-port

# Cleaning cache and other generated files while update
clean-update: clean-update-brew clean-update-port clean-update-pip clean-update-npm clean-update-yarn clean-update-xcode clean-update-rust clean-update-gem clean-update-pod

# Install Homebrew
install-brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install MacPorts
install-port:
	./install-port.sh

# Install npm
install-npm:
	brew install npm

# Install yarn
install-yarn:
	brew install yarn

# Install pod
install-pod:
	sudo gem install cocoapods

# Install rust
install-rust:
	brew install rustup
	rustup-init

# Install Xcode Command Line Tools
install-clitools:
	xcode-select install

# Install casks
install-casks:
	brew install --cask docker firefox-developer-edition postman visual-studio-code vnc-viewer wireshark

# Brew upgrades
update-brew:
	brew update
	brew upgrade

# MacPorts upgrades
update-port:
	sudo port selfupdate

# Pip package updates
update-pip:
	./update-pip.sh

# Npm package update
update-npm:
	npm -g update
	sudo n install stable

# Pod package update
update-pod:
	pod update

# Gem package update
update-gem:
	sudo gem update

# Yarn package update
update-yarn:
	yarn global upgrade

# Flutter update
update-flutter:
	flutter upgrade

# Composer update
update-composer:
	composer update

# Mac software updates
update-clitools:
	softwareupdate -i -a

# Clean MacPort's installation files
clean-install-port:
	rm ./MacPorts-2.7.2.tar.bz2

# Clean Composer's Internal Cache
clean-update-composer:
	composer clear-cache

# Clean Homebrew's cache
clean-update-brew:
	brew autoremove
	brew cleanup --prune=all

# Clean MacPorts cache
clean-update-port:
	sudo port reclaim
#	sudo port clean --all

# Remove generated files and pip's cache
clean-update-pip:
	rm requirements.txt
	pip cache purge

# Clean npm cache (Not required as cache self-heals)
clean-update-npm:
	npm -g cache clean

# Clean Gem cache
clean-update-gem:
	sudo gem cleanup

# Clean Pod cache
clean-update-pod:
	pod cache clean --all

# Clean Yarn cache
clean-update-yarn:
	yarn cache clean

# Remove Xcode's unavailable simulator devices
clean-update-xcode-unavailable:
	xcrun simctl delete unavailable

# Remove Xcode's all simulator devices
clean-update-xcode-all:
	xcrun simctl delete all

# Free up space occupied by rust-docs
clean-update-rust:
	cargo --global clean --doc
