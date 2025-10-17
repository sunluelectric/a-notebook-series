%%

% problem description
% a robot in a maze of 4x4
% it moves horizontally, vertically, diagonally, or to stay where it is (i.e., it is allowed to move a maximum of 1 position at each axis)
% the robot cannot move outside the boundary
% the transition model is deterministic, meaning that an action has
% deterministic result and the robot will move towards that direction
% rewards, both positive and negative, are setup for some of the locations
% in the maze
% the rewards are not staionary and can take 2 different setups; the two
% setups take turns periodically as a function of time, switching setups
% every 5 actions
% reward can be made stationary by adding time to the state
% the robot has a sense of its location and time; the time can take 10
% values
% the rewards are known prior to the game

% state (4x4x10)
numState = 4*4*10;
utilityState = zeros(4,4,10); % for intuition, the utility is put into a matrix

% action (3x3, unless boundary)
numAction = 3*3;

% reward
rewardState = zeros(4,4,10); % for intuition, the utility is put into a matrix
for idx = 1:10
    if idx <=5
        rewardState(1,1,idx) = 1;
        rewardState(3,2,idx) = -10;
        rewardState(3,3,idx) = -10;
        rewardState(4,4,idx) = -0.5;
    else
        rewardState(1,1,idx) = -5;
        rewardState(2,2,idx) = -10;
        rewardState(3,2,idx) = -10;
        rewardState(3,3,idx) = -10;
        rewardState(4,4,idx) = 1;
    end
end

% discount factor
gammaDiscount = 0.8;

iterNum = 100;
for idxIterNum = 1:iterNum
    disp(idxIterNum)
    utilityStateHistory = utilityState;
    for idxTime = 1:size(utilityState,3)
        for idxY = 1:size(utilityState,2)
            for idxX = 1:size(utilityState,1)
                if idxTime < 10
                    utilityState(idxX,idxY,idxTime) = rewardState(idxX,idxY,idxTime) + ...
                        max(gammaDiscount*utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),idxTime+1),[],"all");
                else
                    utilityState(idxX,idxY,idxTime) = rewardState(idxX,idxY,idxTime) + ...
                        max(gammaDiscount*utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),1),[],"all");
                end
            end
        end
    end
    utilityStateDiff = max(abs(utilityState - utilityStateHistory),[],"all");
    if utilityStateDiff < 1e-4
        break;
    end
end

%%

% problem description
% a robot in a maze of 4x4
% it moves horizontally, vertically, diagonally, or to stay where it is (i.e., it is allowed to move a maximum of 1 position at each axis)
% the robot cannot move outside the boundary
% the transition model is non-deterministic; if it fails, the robot has a
% 1/9 probability of moving to any directions or stay where it iss
% rewards, both positive and negative, are setup for some of the locations
% in the maze
% the rewards are not staionary and can take 2 different setups; the two
% setups take turns periodically as a function of time, switching setups
% every 5 actions
% reward can be made stationary by adding time to the state
% the robot has a sense of its location and time; the time can take 10
% values
% the rewards are known prior to the game

% state (4x4x10)
numState = 4*4*10;
utilityState = zeros(4,4,10); % for intuition, the utility is put into a matrix

% action (3x3, unless boundary)
numAction = 3*3;
successRate = 0.9;

% reward
rewardState = zeros(4,4,10); % for intuition, the utility is put into a matrix
for idx = 1:10
    if idx <=5
        rewardState(1,1,idx) = 1;
        rewardState(3,2,idx) = -10;
        rewardState(3,3,idx) = -10;
        rewardState(4,4,idx) = -0.5;
    else
        rewardState(1,1,idx) = -5;
        rewardState(2,2,idx) = -10;
        rewardState(3,2,idx) = -10;
        rewardState(3,3,idx) = -10;
        rewardState(4,4,idx) = 1;
    end
end

% discount factor
gammaDiscount = 0.8;

iterNum = 100;
for idxIterNum = 1:iterNum
    disp(idxIterNum)
    utilityStateHistory = utilityState;
    for idxTime = 1:size(utilityState,3)
        for idxY = 1:size(utilityState,2)
            for idxX = 1:size(utilityState,1)
                if idxTime < 10
                    utilityState(idxX,idxY,idxTime) = rewardState(idxX,idxY,idxTime) + ...
                        max( ...
                        (1-successRate)*gammaDiscount*mean(utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),idxTime+1),"all")*ones(3,3) + ...
                        successRate*gammaDiscount*utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),idxTime+1), ...
                        [],"all");
                else
                    utilityState(idxX,idxY,idxTime) = rewardState(idxX,idxY,idxTime) + ...
                        max( ...
                        (1-successRate)*gammaDiscount*mean(utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),1),"all")*ones(3,3) + ...
                        successRate*gammaDiscount*utilityStateHistory(bound(idxX-1:idxX+1,1,4),bound(idxY-1:idxY+1,1,4),1), ...
                        [],"all");
                end
            end
        end
    end
    utilityStateDiff = max(abs(utilityState - utilityStateHistory),[],"all");
    if utilityStateDiff < 1e-4
        break;
    end
end
