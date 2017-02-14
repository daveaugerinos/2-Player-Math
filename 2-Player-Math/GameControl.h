//
//  GameControl.h
//  2-Player-Math
//
//  Created by Dave Augerinos on 2017-02-13.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameControl : NSObject

-(NSString *)generateMathQuestion;
-(BOOL)checkPlayerAnswer:(NSString *)playerAnswer;
-(NSString *)getPlayerScore:(NSString *)player;
-(NSString *)getPlayerLives:(NSString *)player;
-(BOOL)checkPlayerLives:(Player *)player;
-(BOOL)gameOver;

@end
