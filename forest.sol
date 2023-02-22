pragma solidity ^0.8.0;

contract TreePlantingRewards {
    
    mapping(address => uint256) public treesPlanted;
    mapping(address => bool) public eligibleForRewards;
    
    uint256 public constant REWARD_AMOUNT = 1000; // reward amount in wei
    
    event TreesPlanted(address indexed user, uint256 numTrees);
    event RewardEligibilityChanged(address indexed user, bool eligible);
    event RewardClaimed(address indexed user, uint256 amount);
    
    function plantTrees(uint256 numTrees) public {
        treesPlanted[msg.sender] += numTrees;
        emit TreesPlanted(msg.sender, numTrees);
    }
    
    function setEligibilityForRewards(bool eligible) public {
        eligibleForRewards[msg.sender] = eligible;
        emit RewardEligibilityChanged(msg.sender, eligible);
    }
    
    function claimReward() public {
        require(eligibleForRewards[msg.sender], "User not eligible for rewards");
        uint256 rewardAmount = treesPlanted[msg.sender] * REWARD_AMOUNT;
        require(rewardAmount > 0, "No reward available");
        treesPlanted[msg.sender] = 0;
        (bool success,) = msg.sender.call{value: rewardAmount}("");
        require(success, "Reward transfer failed");
        emit RewardClaimed(msg.sender, rewardAmount);
    }
}
