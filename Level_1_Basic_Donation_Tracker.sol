// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract EtherDonationTracker {

    // 1. Mapping to track how much each address has donated
    mapping(address => uint) public donations;

    // 2. Function to receive Ether and store it in mapping
    function donate() public payable {
        donations[msg.sender] += msg.value;
    }

    // 3. View your own donation total
    function myTotalDonation() public view returns (uint) {
        return donations[msg.sender];
    }

    // 4. View someone else's donation (e.g., for admin dashboard)
    function getDonationOf(address user) public view returns (uint) {
        return donations[user];
    }

    // 5. Get total contract balance (sum of all donations)
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
