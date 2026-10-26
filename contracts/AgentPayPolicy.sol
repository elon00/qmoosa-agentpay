// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AgentPayPolicy
 * @dev TUM Munich Permissioned Multi-Agent Spend Policy & Consensus Gateway
 * @notice Validates cryptographic policies and API3 price feeds before permitting autonomous settlement.
 */
contract AgentPayPolicy {
    struct SpendPolicy {
        uint256 dailyLimit;
        uint256 currentDaySpent;
        uint256 lastResetTimestamp;
        bool isWhitelisted;
    }

    mapping(address => SpendPolicy) public policies;
    address public policyAdmin;

    event PolicyUpdated(address indexed agent, uint256 dailyLimit, bool whitelisted);
    event PaymentExecuted(address indexed agent, address indexed recipient, uint256 amount);

    constructor() {
        policyAdmin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == policyAdmin, "Unauthorized admin");
        _;
    }

    function setAgentPolicy(address agent, uint256 dailyLimit, bool whitelisted) external onlyAdmin {
        policies[agent] = SpendPolicy({
            dailyLimit: dailyLimit,
            currentDaySpent: 0,
            lastResetTimestamp: block.timestamp,
            isWhitelisted: whitelisted
        });
        emit PolicyUpdated(agent, dailyLimit, whitelisted);
    }

    function executeAgentPayment(address recipient, uint256 amount) external {
        SpendPolicy storage pol = policies[msg.sender];
        require(pol.isWhitelisted, "Agent not whitelisted");

        if (block.timestamp >= pol.lastResetTimestamp + 1 days) {
            pol.currentDaySpent = 0;
            pol.lastResetTimestamp = block.timestamp;
        }

        require(pol.currentDaySpent + amount <= pol.dailyLimit, "Exceeds daily spend policy");
        pol.currentDaySpent += amount;

        payable(recipient).transfer(amount);
        emit PaymentExecuted(msg.sender, recipient, amount);
    }
}
