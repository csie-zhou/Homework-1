// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    bool public isFirstEnrollment;
    uint256 public registrationCode;

    constructor() {
        isFirstEnrollment = true;
    }

    function register() external returns (uint256) {
        if (isFirstEnrollment) {
            isFirstEnrollment = false;
            registrationCode = 1000; // Set code to 1000 for the first enrollment
        } else {
            registrationCode = 123; // Set code to 123 for subsequent enrollments
        }
        return registrationCode;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if (IClassroomV2(msg.sender).isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        if (gasleft() < 6660) {
            return 123;
        } else {
            return 1000;
        }
        // return gasleft();
    }
}
