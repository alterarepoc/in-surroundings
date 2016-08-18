# Binaries.
gitbook = ./node_modules/.bin/gitbook

# Directories
source = ./book
output = ./build
tmp = ./tmp

# Remove non-checked-in files.
clean:
	@rm -rf $(output) $(tmp)

# Install dependencies from npm.
node_modules: package.json
	@npm install
	@touch package.json

install: node_modules
	@$(gitbook) install

init: install
	@$(gitbook) init $(source)

serve:
	@$(gitbook) serve $(source) $(tmp)

build:
	@$(gitbook) build $(source) $(output)


.PHONY: clean build
