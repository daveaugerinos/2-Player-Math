//
//  GameControl.m
//  2-Player-Math
//
//  Created by Dave Augerinos on 2017-02-13.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "GameControl.h"

@implementation GameControl
{
    Player *playerOne;
    Player *playerTwo;
    Player *activePlayer;
    int currentQuestionAnswer;
    NSString *mathQuestion;
    BOOL gameOver;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        playerOne = [[Player alloc] initWithName:@"Player 1" andLives:3];
        playerTwo = [[Player alloc] initWithName:@"Player 2" andLives:3];
        activePlayer = playerOne;
        gameOver = NO;
    }
    return self;
}

-(NSString *)generateMathQuestion {
    
    // Create two random operands between 1 and 20
    NSString *randomQuestion;
    int leftValue = arc4random_uniform(20) + 1;
    int rightValue = arc4random_uniform(20) + 1;
    int chooseQuestionType = arc4random_uniform(3);
    
    if(chooseQuestionType == 0) {
        // Addition question
        randomQuestion = [NSString stringWithFormat:@"%@: %i + %i?", [activePlayer getPlayerName], leftValue, rightValue];
        currentQuestionAnswer = leftValue + rightValue;
    }
    
    else if(chooseQuestionType == 1 ) {
        // Subtration question
        randomQuestion = [NSString stringWithFormat:@"%@: %i - %i?", [activePlayer getPlayerName],leftValue, rightValue];
        currentQuestionAnswer = leftValue - rightValue;
    }
    
    else if (chooseQuestionType == 2) {
        // Multiplication question
        randomQuestion = [NSString stringWithFormat:@"%@: %i * %i?", [activePlayer getPlayerName], leftValue, rightValue];
        currentQuestionAnswer = leftValue * rightValue;
    }

    return randomQuestion;
}

-(void)switchActivePlayer {
    
    if([activePlayer isEqual:playerOne]) {
        activePlayer = playerTwo;
    }
    else {
        activePlayer = playerOne;
    }
}

-(BOOL)checkPlayerAnswer:(NSString *)playerAnswer {

    BOOL isCorrect = NO;
    
    if(currentQuestionAnswer == [playerAnswer intValue]) {
        isCorrect = YES;
        [activePlayer increaseScoreBy:1];
    }
    else {
        [activePlayer decreaseLivesBy:1];
    }
    
    [self switchActivePlayer];
    
    return isCorrect;
}

-(NSString *)getPlayerScore:(NSString *)player {
 
    NSString *myScore;
    
    if([player isEqualToString:@"Player 1"]) {
        myScore = [NSString stringWithFormat:@"Player 1 Score: %i", [playerOne getCurrentScore]];
    }
    
    else if([player isEqualToString:@"Player 2"]) {
        myScore = [NSString stringWithFormat:@"Player 2 Score: %i", [playerTwo getCurrentScore]];
    }
    
    return myScore;
}

-(NSString *)getPlayerLives:(NSString *)player {

    NSString *myScore;
    
    if([player isEqualToString:@"Player 1"]) {
        myScore = [NSString stringWithFormat:@"Player 1 Lives: %i", [playerOne getCurrentLives]];
    }
    
    else if([player isEqualToString:@"Player 2"]) {
        myScore = [NSString stringWithFormat:@"Player 2 Lives: %i", [playerTwo getCurrentLives]];
    }
    
    return myScore;
}

-(BOOL)checkPlayerLives:(Player *)player {
    return [player getCurrentLives];
}

-(BOOL)gameOver {
    
    if(playerOne.getCurrentLives == 0 || playerTwo.getCurrentLives == 0) {
        gameOver = YES;
    }
    
    return gameOver;
}

@end
