pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 0;

  //The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);
function testAddPet() public {
  adoption.addPet("name", "1 year", "cat", "mixed", "images/concrete.jpg", "Michigan");
  adoption.addPet("Not name", "2 year", "dog", "golden retriever", "n/a", "New York");


  Assert.equal("name", adoption.getPetName(0), "pet name should be equal to name");
  Assert.equal("1 year", adoption.getPetAge(0), "pet age should be equal to 1 year");
  Assert.equal("cat", adoption.getPetSpecies(0), "pet species should be equal to cat");
  Assert.equal("mixed", adoption.getPetBreed(0), "pet breed should be equal to mixed");
  Assert.equal("images/concrete.jpg", adoption.getPetPicture(0), "pet picture should be equal to images/concrete.jpg");
}

  // Testing the adopt() function
function testUserCanAdoptPet() public {
  uint returnedId = adoption.adopt(expectedPetId);

  Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
}

// Testing retrieval of a single pet's owner
function testGetAdopterAddressByPetId() public {
  address adopter = adoption.adopters(expectedPetId);

  Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}

// Testing retrieval of all pet owners
function testGetAdopterAddressByPetIdInArray() public {
  // Store adopters in memory rather than contract's storage
  address[16] memory adopters = adoption.getAdopters();

  Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
}

}