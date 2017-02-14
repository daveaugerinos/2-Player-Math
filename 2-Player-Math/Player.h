//
//  Player.h
//  2-Player-Math
//
//  Created by Dave Augerinos on 2017-02-13.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

-(instancetype)initWithName:(NSString *)name andLives:(int)lives;
-(void)decreaseLivesBy:(int)livesLost;
-(void)increaseScoreBy:(int)scoreIncrease;
-(int)getCurrentScore;
-(int)getCurrentLives;
-(NSString *)getPlayerName;

@end
