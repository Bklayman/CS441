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
    if([Singleton sharedObject].correctAnswer){
        _Description.text = @"There are " + [@([Singleton sharedObject].numFound) stringValue] + " " + [Singleton sharedObject].guess + "s in this word.";
    } else {
        _Description.text = @"Your guess is incorrect.";
    }
}


@end
