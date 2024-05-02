//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedWebHosting {
    
    struct Website {
        address owner;
        string contentAddress;
        string webtype; // IPFS hash or other decentralized storage address
    }
    
    mapping(string => Website) websites; // Domain name to Website mapping
    
    // Event emitted when a new website is registered
    event WebsiteRegistered(address indexed owner, string domain, string contentAddress, string webtype);
    
    // Modifier: Only the owner of a website can perform certain actions
    modifier onlyOwner(string memory domain) {
        require(msg.sender == websites[domain].owner, "Only the owner can perform this action");
        _;
    }
    
    // Register a new website
    function registerWebsite(string memory domain, string memory contentAddress, string memory webtype) public {
        require(bytes(websites[domain].contentAddress).length == 0, "Domain already registered");
        websites[domain] = Website(msg.sender, contentAddress, webtype);
        emit WebsiteRegistered(msg.sender, domain, contentAddress, webtype);
    }
    
    // Update the content address of a website
    function updateContentAddress(string memory domain, string memory newContentAddress) public onlyOwner(domain) {
        websites[domain].contentAddress = newContentAddress;
    }
    function updateWebtype(string memory domain, string memory newWebtype)public onlyOwner(domain){
        websites[domain].webtype = newWebtype;
    }
    
    // Get the content address of a website
    function getContentAddress(string memory domain) public view returns (string memory) {
        return websites[domain].contentAddress;
    }
    function getWebtype(string memory domain) public view returns (string memory){
        return websites[domain].webtype
    }
}
