
  Feature: The visitor is able able to select a number of registration options from the list


    Scenario: The visitor is able to as an ordinary member
      Given the visitor is on the landing page
      When the visitor goes to the "register" page
      Then the visitor will see the available registration options

