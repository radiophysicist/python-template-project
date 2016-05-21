# Project name
PROJECT=python-template
# Path to install virtualenv for the project
VENV=~/tmp/virtualenv/$(PROJECT)
# Python version to be used
PYTHON=python2.7


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


# Target to remove automatically generated files
.PHONY: clean
clean:
	# Remove pyc files
	pyclean .
	# Remove pytest cache
	find . -name '.cache' -type d -exec rm -r {} +
	find . -name '__pycache__' -type d -exec rm -r {} +

