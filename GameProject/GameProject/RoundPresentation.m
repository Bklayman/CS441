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
    NSArray* categories = [NSArray arrayWithObjects:@"Countries", @"People", @"Video Games", @"Animals", @"Foods", @"Drinks", @"Colors", @"Actions", @"Stores", @"Technologies", @"Apps", nil];
    _roundCategory.text = categories[arc4random_uniform([categories count])];
    [Singleton sharedObject].roundCategory = _roundCategory.text;
}

@end
