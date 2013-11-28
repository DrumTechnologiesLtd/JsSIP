.PHONY: all clean clean-all install clean-install force-install test clean-test lint publish tag

all: install lint test

clean:
	rm -rf dist

clean-test:

clean-all: clean-test clean
	rm -rf node_modules

install:
	npm install
	./node_modules/.bin/grunt

force-install: clean-install install

test:

lint:

publish:
	npm publish .

tag: lint test
	git tag -f "`./node_modules/.bin/getJsonValue ./package.json version`"
	git push origin --tags
