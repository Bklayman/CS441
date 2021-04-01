//
//  Blackjack.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 4/1/21.
//

#include "Blackjack.h"
#include "Singleton.h"

@interface Blackjack ()

@end

@implementation Blackjack

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (IBAction)instructionsClicked:(id)sender{
    [Singleton sharedObject].gameSource = 2;
}

@end
