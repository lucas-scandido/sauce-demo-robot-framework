# Sauce Demo - Automated Tests
E2E Test Automation Project for the application **[Sauce Demo](https://www.saucedemo.com/)** using **Robot Framework** with **Selenium Library**.

# Prerequisites
1. **`Python`** version: `>=3.13.1`.

📝 On Windows machines, make sure to add [Python ao PATH](https://docs.python.org/3/using/windows.html#the-full-installer) during installation.

# Installation
**1. Clone the repository:**

```
https://github.com/lucas-scandido/sauce-demo-robot-framework.git
```

**2. Navigate to the directory:**

```
cd sauce-demo-robot-framework
```

**3. Install the dependencies:**
- All requirements needed to execute the project are within the file `requirements.txt`.
- To facilitate installation, simply run the command `pip install -r requirements.txt`, which will install all libraries at once.

# Documentations

- **Documentation of the Application Sauce Demo:**
As it is an application for testing purposes, it does not have any specific documentation.

- **Robot Documentation:**
1. [Robot Framework](https://docs.robotframework.org/)
2. [Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

# Project Structure
The project structure was developed based on documentation: [Robot Framework - Project Structure](https://docs.robotframework.org/docs/examples/project_structure). 

- **Estrutura de Pastas:**
```
├── helpers/                            # Helpers resources needed to run the tests, including fixtures and locators    
    └── fixtures/                       # Contains static data files that are used when running tests                                   
        └── alerts.json                 # JSON file that contains all error messages displayed by alerts returned by the application                                  
        └── credentials.json            # JSON file that contains invalid user credentials for authentication                                
    └── locators/                       # Locators used to interact with page elements                                  
        └── locators.py                 # Python file containing the mapped locators   
├── resources/                          # Reusable keywords                                                                                       
    └── common.resource                 # General Keywords are stored here                               
    └── login.resource                  # Keywords for login are stored here                                                       
├── tests/                              # Test Suites                                
    └── login.robot                     # Test Suite for login functionality             
├── README.md                           # Project documentation      
├── .gitignore                          # Which files and folders should be ignored by Git       
├── requirements.txt                    # List of dependencies needed to run the project                              
```

# Test Execution Scripts
```
robot -d ./logs tests/                  # Run all tests in interactive mode.
robot --include <tag_name>              # Runs only tests with the specified tag in interactive mode.
```