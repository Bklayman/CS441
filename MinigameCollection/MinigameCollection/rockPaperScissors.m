//
//  rockPaperScissors.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 3/19/21.
//

#import <Foundation/Foundation.h>
#import "rockPaperScissors.h"

@interface rockPaperScissors ()

@end

@implementation rockPaperScissors

- (void)viewDidLoad{
    [super viewDidLoad];
    _playerHand.hidden = TRUE;
    _opponentHand.hidden = TRUE;
    _points = 0;
    [self setAI];
}

- (void)setAI{
    _AIIndex = arc4random_uniform(4);
}

- (IBAction)rockPressed:(id)sender{
    _playerChoice = 0;
    [self opponentChoose];
}

- (IBAction)paperPressed:(id)sender{
    _playerChoice = 1;
    [self opponentChoose];
}

- (IBAction)scissorsPressed:(id)sender{
    _playerChoice = 2;
    [self opponentChoose];
}

- (void)opponentChoose{
    //TODO
    [self checkResult];
}

- (void)checkResult{
    if((_playerChoice == 0 && _opponentChoice == 1) || (_playerChoice == 1 && _opponentChoice == 2) || (_playerChoice == 2 && _opponentChoice == 0)){
        _points--;
    } else if((_playerChoice == 1 && _opponentChoice == 0) || (_playerChoice == 2 && _opponentChoice == 1) || (_playerChoice == 0 && _opponentChoice == 2)){
        _points++;
    }
}

@end
