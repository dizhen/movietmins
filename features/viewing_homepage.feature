Feature: Viewing homepage

  Scenario: View homepage
    Given a user visits the static pages
    When they visit the homepage
    Then they should see the name of the website