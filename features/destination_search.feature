
Feature: user searches for a destination

  Scenario: user goes to last minute home page
    Given i am on the last minute home screen
    Then i should see the text

  @javascript
  Scenario: user enters a destination to search for
    Given i am on the last minute home screen
    When i enter Rome into the destination filed
    And I click the Search button
    Then i should see results for Rome

  @current
  Scenario: user searches for a city break in Paris
    Given i am on the last minute home screen
    And I select "city break" from the options menu
    When I enter my search criteria
    And I click the Search for city break button







