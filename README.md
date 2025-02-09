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

- **Folder Structure:**
```
├── helpers/                            # Helpers resources needed to run the tests, including fixtures and locators    
    └── fixtures/                       # Contains static data files used during test execution                                   
        └── cart/
            └── selectors.json          # JSON file that stores data test id of locators to be used randomly in tests
        └── checkout/
            └── steps.json              # JSON file containing all validation data for the checkout steps    
        └── inventory/
            └── inventory.json          # JSON file storing a list of all inventory items details (name, description and price)                              
        └── login/
            └── alerts.json             # JSON file containing error messages displayed on the login page                                       
    └── libs/                           # Custom Libraries                                  
        └── inventory/
            └── inventory.py            # Contains custom libraries for validating multiples inventory and button details                         
    └── locators/                       # Locators used to interact with page elements                                  
        └── locators.py                 # Python file containing the mapped locators   
├── resources/                          # Reusable keywords
    └── cart/                                 
        └── cart.resource               # Cart Keywords  
    └── checkout/                       
        └── checkout.resource           # Checkout Keywords                                                                                         
    └── common/                         
        └── common.resource             # Common Keywords 
    └── inventory/                        
        └── inventory.resource          # Inventory Keywords                        
    └── login/                           
        └── login.resource              # Login Keywords                                                
├── tests/                              # Test Suites
    └── cart/                           
        └── cart.robot                  # Test Suite for Cart 
    └── checkout/                       
        └── checkout.robot              # Test Suite for Checkout 
    └── inventory/                      
        └── inventory.robot             # Test Suite for Inventory                                  
    └── login/                         
        └── invalid_login.robot         # Test Suite for Invalid Login 
        └── login.robot                 # Test Suite for Valid Login              
├── README.md                           # Project documentation      
├── .gitignore                          # Files and folders should be ignored by Git       
├── requirements.txt                    # List of dependencies needed to run the project                              
```

# Test Execution Scripts
📝 The values ​​of the variables can be found on the website **[Sauce Demo](https://www.saucedemo.com/)**

```
robot --variable USERNAME:<username> --variable PASSWORD:<password> -d ./logs tests/<folder>/<file>.robot                        # Runs all tests in interactive mode.
robot --variable USERNAME:<username> --variable PASSWORD:<password> --include <tag_name> -d ./logs tests/<folder>/<file>.robot   # Runs only tests with the specified tag in interactive mode.
```