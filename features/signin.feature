

    Feature: Sign in page

      @current
      Scenario: A member is able to log in via the sign in page
        Given the visitor is on the landing page
        And the visitor goes to the "sign in" page
        When the visitor signs in as an existing member
        Then the dashboard will be visible




