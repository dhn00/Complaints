// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Complaints {
    // Define a struct to represent a complaint.
    // It includes the victim's name, the date of the complaint,
    // a description of the complaint, and the status of the complaint.
    struct Complaint {
        string victimName;
        uint256 date;
        string description;
        bool resolved;
    }

    // Define a mapping to store the complaints.
    // The key of the mapping is the complaint ID, which is auto-generated.
    mapping (uint256 => Complaint) public complaints;

    // Keep track of the next complaint ID to use.
    uint256 public nextComplaintId = 0;

    // Define a function to add a new complaint.
    function addComplaint(string memory _victimName, string memory _description) public {
        // Create a new complaint with the given information and the next complaint ID.
        // Set the initial resolution status to false.
        complaints[nextComplaintId] = Complaint(_victimName, block.timestamp, _description, false);

        // Increment the next complaint ID.
        nextComplaintId++;
    }

    // Define a function to update the status of a complaint.
    function updateComplaintStatus(uint256 _complaintId, bool _resolved) public {
        // Get the complaint with the given ID.
        Complaint storage complaint = complaints[_complaintId];

        // Update the status of the complaint.
        complaint.resolved = _resolved;
    }

    // Define a function to get the details of a complaint.
    function getComplaint(uint256 _complaintId) public view returns (string memory, uint256, string memory, bool) {
        // Get the complaint with the given ID.
        Complaint storage complaint = complaints[_complaintId];

        // Return the details of the complaint.
        return (complaint.victimName, complaint.date, complaint.description, complaint.resolved);
    }
}
