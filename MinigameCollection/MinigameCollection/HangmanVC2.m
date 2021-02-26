//
//  HangmanVC2.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/26/21.
//

#include "HangmanVC2.h"
#include "Singleton.h"

@interface HangmanVC2 ()

@end

@implementation HangmanVC2

- (void)viewDidLoad {
    if(![Singleton sharedObject].gaveAnswer){
        _Description.text = @"No guess was given. Please return to the game area.";
    } else {
        //TODO
    }
}


@end
