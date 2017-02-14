//
//  ViewController.m
//  2-Player-Math
//
//  Created by Dave Augerinos on 2017-02-13.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "ViewController.h"
#import "GameControl.h"
#define kPlayer1 @"Player 1"
#define kPlayer2 @"Player 2"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mathQuestionLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneLivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoLivesLabel;
@property (strong, nonatomic) GameControl *currentGame;
@property (strong, nonatomic) NSMutableString *playerAnswer;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;
@property (assign, nonatomic) BOOL isNegative;
@property (weak, nonatomic) IBOutlet UILabel *feedBackLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeGame {
    
    // Inialize setup
    self.currentGame = [[GameControl alloc] init];
    self.playerAnswer = [[NSMutableString alloc] init];
    self.mathQuestionLabel.text = [self.currentGame generateMathQuestion];
    self.playerOneScoreLabel.text = [self.currentGame getPlayerScore:kPlayer1];
    self.playerTwoScoreLabel.text  = [self.currentGame getPlayerScore:kPlayer2];
    self.playerOneLivesLabel.text = [self.currentGame getPlayerLives:kPlayer1];
    self.playerTwoLivesLabel.text = [self.currentGame getPlayerLives:kPlayer2];
    self.isNegative = NO;
    
}

- (IBAction)enterButton:(UIButton *)sender {
    
    // Set lable alpha to 1.0
    [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 1.0;} completion:nil];
    
    // Check answer and provide feedback
    if([self.currentGame checkPlayerAnswer:self.playerAnswer]) {
        self.feedBackLabel.textColor = [UIColor greenColor];
        self.feedBackLabel.text = @"CORRECT!";
        [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 0.0;} completion:nil];
    }
    else {
        self.feedBackLabel.textColor = [UIColor redColor];
        self.feedBackLabel.text = @"INCORRECT!";
        [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 0.0;} completion:nil];
    }
    
    // Update results
    self.playerOneScoreLabel.text = [self.currentGame getPlayerScore:kPlayer1];
    self.playerTwoScoreLabel.text  = [self.currentGame getPlayerScore:kPlayer2];
    self.playerOneLivesLabel.text = [self.currentGame getPlayerLives:kPlayer1];
    self.playerTwoLivesLabel.text = [self.currentGame getPlayerLives:kPlayer2];
    
    // Ask to play again
    if([self.currentGame gameOver]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!"
                                                                       message:@"Would you like to play again?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
                                    
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {[self initializeGame];}];
        
        [alert addAction:okay];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
        self.mathQuestionLabel.text = [self.currentGame generateMathQuestion];
    }
    
    [self.playerAnswer setString:@""];
    self.answerTextField.text = @"";
    
}

- (IBAction)zeroButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"0"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)oneButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"1"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)twoButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"2"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)threeButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"3"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)fourButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"4"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)fiveButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"5"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)sixButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"6"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)sevenButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"7"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)eightButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"8"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)nineButton:(UIButton *)sender {
    [self.playerAnswer appendString:@"9"];
    self.answerTextField.text = self.playerAnswer;
}

- (IBAction)clearButton:(UIButton *)sender {
    [self.playerAnswer setString:@""];
    self.answerTextField.text = @"";
}

- (IBAction)plusMinusButton:(UIButton *)sender {

    [self.playerAnswer setString:@""];
    self.answerTextField.text = @"";
    
    if(!self.isNegative) {
        self.isNegative = YES;
        [self.playerAnswer appendString:@"-"];
        self.answerTextField.text = self.playerAnswer;
    }
    else {
        self.isNegative = NO;
        [self.playerAnswer appendString:@""];
        self.answerTextField.text = self.playerAnswer;
    }
}

@end
