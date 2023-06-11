/*
1. Display all available pets
2. adoption screen that removes a pet from the availability list 
3. intake screen that adds a pet from the availability list
4. Additional information or detailed screen for each pet 
5. Display for resources for taking care of a pet
}

Actual features
  Display all pets
  adopt a pet 
  additional information added to each pet 
  unique image for each pet 
  *attempt for managing pets with solidity contract instead of json file 
     pets can be added and the unit test works though adding pets to the page not working 
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract Adoption {

    address[16] public adopters;

    struct Pet {
        uint id;
        string name;
        string age; 
        address owner; 
        bool isAdopted;
        string species;
        string breed;
        string picture;
        string location;
    }

    Pet[] public availablePets;

    function addPet(string calldata _name, string calldata _age, string calldata _species, string calldata _breed, string calldata _picture, string calldata _location) external 
    {
        uint size = availablePets.length;
        availablePets.push(Pet({id: size, name : _name, age: _age, species: _species, breed: _breed, picture: _picture, location: _location, isAdopted: false , owner: msg.sender}));
    }

    function getPetName(uint index) external view returns (string memory)
    {
      Pet storage pet = availablePets[index];
      return pet.name;
    }

    function getPetAge(uint index) external view returns (string memory)
    {
      Pet storage pet = availablePets[index];
      return pet.age;
    }

    function getPetSpecies(uint index) external view returns (string memory)
    {
      Pet storage pet = availablePets[index];
      return pet.species;
    }

    function getPetBreed(uint index) external view returns (string memory)
    {
      Pet storage pet = availablePets[index];
      return pet.breed;
    }

    function getPetPicture(uint index) external view returns (string memory)
    {
      Pet storage pet = availablePets[index];
      return pet.picture;
    }

    function getPetId(uint index) external view returns (uint)
    {
      Pet storage pet = availablePets[index];
      return pet.id;
    }

    function getPetLocation(uint index) external view returns (string memory)
    {
       Pet storage pet = availablePets[index];
       return pet.location;
    }

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 6);

    adopters[petId] = msg.sender;
    availablePets[petId].owner = adopters[petId];
    availablePets[petId].isAdopted = true;

    return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
    return adopters;
    }

}
