Feature: Test Main behavior of petstore API

  Background:
  * url petstoreApiBase
  * configure logPrettyRequest = true
  * configure logPrettyResponse = true

  Scenario: Create a valid Pet and get it By id
    Given path '/pets'
    And request {name: 'Rex', category : 'DOG'}
    When method post
    Then status 201
    And match response.id == '#present'
    And match response.status == 'AVAILABLE'

    * def urlGetPet = responseHeaders['Location'][0]
    * def petId = response.id

    Given path urlGetPet
    When method get
    Then status 200
    And match response.id == petId


