Feature: As a user I should be able to sign up

  @javascript
  Scenario: Andrii register in the application
    When I visit the sign up page
    And I fill the Email field with andreykuluev96@gmail.com
    And I fill the Password field with 123654123
    And I fill the Password confirmation field with 123654123
    And I submit form
    Then I should see the following text: Welcome! You have signed up successfully.
