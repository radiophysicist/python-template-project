**Python virtualenv template project**

Contains python project quickstart template. 
Uses virtualenv to install project dependencies.
Uses GNU make to execute common tasks 

To start you need to make the following steps:

0. Clone the project using command
`git clone git@github.com:radiophysicist/python-template-project.git`
1. Specify project name and python version in the Makefile
2. Add necessary dependencies in the `requirements.txt` file
2. Initialize virtualenv with command
`make venv`
3. Activate virtualenv in the sh-compatible linux shell with command
`source venv_activate`
