//
//  RoundPresentation.m
//  GameProject
//
//  Created by Brendan Klayman on 3/24/21.
//

#import "RoundPresentation.h"
#include "Singleton.h"

@interface RoundPresentation ()

@end

@implementation RoundPresentation

- (void)viewDidLoad {
    [super viewDidLoad];
    [self chooseLetter];
    [self chooseCategory];
}

- (void)chooseLetter {
    int randomLetter = arc4random_uniform(26);
    char roundLetter = 'A' + randomLetter;
    [Singleton sharedObject].roundLetter = roundLetter;
    _roundLetter.text = [NSString stringWithFormat:@"%c", roundLetter];
}

- (void)chooseCategory {
    //TODO
}

@end
