

    Feature:  The visitor is able to perform a new registration

      @current
      Scenario: Register as a new member and pay a pound
        Given the visitor is on the landing page
        When the visitor goes to the "new registration" page
        Then the visitor can complete a new registration
