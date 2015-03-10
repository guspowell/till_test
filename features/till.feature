Feature: Using the till
  As a till user
  I want to be able to use the till
  So I can provide my customer with  a valid receipt

  Scenario: Adding an item and quantity
    Given I am a user with a till
    When I choose an item and a quantity
    Then I should see the item and quantity


  Scenario: Loading the till information
    Given I am a user with a till
    When I load the json file into the till
    Then the till should know the shop name, address, phone number
