# Project name
PROJECT=python-template
# Path to install virtualenv for the project
VENV=~/tmp/virtualenv/$(PROJECT)
# Python version to be used
PYTHON=python2.7
# Command to run unit tests
TESTCMD=$(VENV)/bin/py.test


# Target to initialize virtualenv itself
$(VENV)/init_ts:
	virtualenv --system-site-packages -p $(PYTHON) $(VENV) && touch $@


# Target to install virtualenv dependencies
$(VENV)/deps_ts: requirements.txt
	$(VENV)/bin/pip install -U -r requirements.txt && touch $@


# Target to initialize virtualenv and install dependencies specified
.PHONY: venv clean-venv
venv: $(VENV)/init_ts $(VENV)/deps_ts

# Target to remove virtualenv files
clean-venv:
	rm -rf $(VENV)


# Target to generate doxygen documentation
.PHONY: doc
doc:
	doxygen

# Target to remove doxygen documentation
clean-doc:
	rm -rf ./doc


# Target to run unittests using pytest
.PHONY: unit unit-coverage
unit: venv
	clear
	$(TESTCMD)

# Target to run unittests with generating coverage report
unit-coverage: venv
	clear
	$(TESTCMD) --cov-report term-missing --cov-report html --cov=./


# Target to remove automatically generated files
.PHONY: clean
clean: clean-doc
	# Remove pyc files
	pyclean .
	# Remove pytest cache
	find . -name '.cache' -type d -exec rm -r {} +
	find . -name '__pycache__' -type d -exec rm -r {} +
	# Remove coverage report
	rm -rf ./htmlcov
	rm -f ./.coverage


# Create tar archive of the latest commit
.PHONY: tarball
tarball:
	rm -f ../$(PROJECT).tar.gz
	git archive --prefix=$(PROJECT)/ -o ../$(PROJECT).tar.gz HEAD
