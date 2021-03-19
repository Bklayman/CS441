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
    [self setAI];
}

- (void)setAI{
    //TODO
}

- (IBAction)rockPressed:(id)sender{
    //TODO
    [self opponentChoose];
}

- (IBAction)paperPressed:(id)sender{
    //TODO
    [self opponentChoose];
}

- (IBAction)scissorsPressed:(id)sender{
    //TODO
    [self opponentChoose];
}

- (void)opponentChoose{
    //TODO
}

- (void)chooseAI{
    //TODO
}

@end
