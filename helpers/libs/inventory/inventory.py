from robot.api.deco import keyword

@keyword('Validate Invetory Details')
def validate_inventory_details(inventory):
    for item in inventory:
        name = item["name"]
        description = item["description"]
        price = item["price"]
        print(f"Name: {name}, Description: {description}, Price: {price}")

@keyword('Validate Buttons Details')
def validate_buttons(inventory):
    for buttons in inventory:
        btn = buttons["name"]
        print(f"Button: {btn}")