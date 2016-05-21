# Python virtualenv template project

Contains python project quickstart template. 
Uses [virtualenv](https://virtualenv.pypa.io/en/stable/) to install project dependencies.
Uses [GNU make](https://www.gnu.org/software/make/) to execute common tasks 

To start you need to make the following steps:

1. Clone the project using command
`git clone git@github.com:radiophysicist/python-template-project.git`
2. Specify project name and python version in the `Makefile`
3. Add necessary dependencies in the `requirements.txt` file
4. Initialize virtualenv with command
`make venv`
5. Activate virtualenv in the sh-compatible linux shell with command
`source venv_activate`
