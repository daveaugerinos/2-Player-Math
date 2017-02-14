//
//  Player.m
//  2-Player-Math
//
//  Created by Dave Augerinos on 2017-02-13.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "Player.h"

@implementation Player
{
    NSString *myName;
    int myScore;
    int myLives;
}

- (instancetype)initWithName:(NSString *)name andLives:(int)lives
{
    self = [super init];
    if (self) {
        myName = name;
        myLives = lives;
    }
    return self;
}

-(void)decreaseLivesBy:(int)livesLost {
    myLives -= livesLost;
}

-(void)increaseScoreBy:(int)scoreIncrease {
    myScore += scoreIncrease;
}

-(int)getCurrentScore {
    return myScore;
}

-(int)getCurrentLives {
    return myLives;
}

-(NSString *)getPlayerName {
    return myName;
}

@end
