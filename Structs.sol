// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // all these data will be saved in memory
        // once the execution is finished, the data will not be available
        Car memory toyota = Car("Toyota", 2002, msg.sender);
        Car memory tata = Car({
            model: "TATA",
            owner: msg.sender,
            year: 1994
        });
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2019;
        tesla.owner = msg.sender;

        // not storing in state variable 
        cars.push(toyota);
        cars.push(tata);
        cars.push(tesla);

        // same as initializing the car in memory and pushing in state
        cars.push(Car("Ferrai", 2020, msg.sender));

        // will only get updated within the function
        // as we are loading in from in memory
        // once the function completes execution the modified value vanishes
        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;
        _car.year = 2020;

        // loading from storage
        // the changes will still persist even after execution completes
        Car storage _carMod = cars[0];
        _carMod.year = 1999;
        delete _carMod.owner; // reset the owner to default value -> address(0)

        delete cars[1]; // cars[1] value will be reset to its detault value
    }
}