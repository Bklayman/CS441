//
//  HangmanVC2.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/26/21.
//

#include "HangmanVC2.h"
#include "Singleton.h"
#include "ViewController.h"

@interface HangmanVC2 ()

@end

@implementation HangmanVC2

- (void)viewDidLoad {
    if(![Singleton sharedObject].validAnswer){
        _Description.text = [NSString stringWithFormat:@"%@%c%@", @"You already guessed ", [Singleton sharedObject].guess, @"for this word."];
    } else if([Singleton sharedObject].correctAnswer){
        _Description.text = [NSString stringWithFormat:@"%@%@%s%c%s", @"There are ", [@([Singleton sharedObject].numFound) stringValue], " ", [Singleton sharedObject].guess, "s in this word."];
    } else {
        _Description.text = @"Your guess is incorrect.";
    }
}

@end
