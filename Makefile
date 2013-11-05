.PHONY: all clean clean-all install clean-install force-install test clean-test lint publish tag

TEST_CMD:= NODE_PATH="`pwd`:$(NODE_PATH)" ./node_modules/.bin/mocha
TEST_RESULTS_ROOT:=test/results
TEST_LOGFILE:=$(TEST_RESULTS_ROOT)/tests.log

all: install lint test

clean:
	rm -rf rpm $(siteDir) dist compiledjs

clean-test:
	rm -rf $(TEST_RESULTS_ROOT) *.log

clean-all: clean-test clean
	rm -rf node_modules *.rpm

install:
	grunt
	npm install

force-install: clean-install install

test:

lint:

publish:
	npm publish .

tag: lint test
	git tag -f "`./node_modules/.bin/getJsonValue ./package.json version`"
	git push origin --tags
