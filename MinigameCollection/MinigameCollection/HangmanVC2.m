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
    if([Singleton sharedObject].gameOver){
        _Description.text = [NSString stringWithFormat:@"Game Over. Your word was %@.", [Singleton sharedObject].wordToGuess];
    } else if ([Singleton sharedObject].winGame){
        _Description.text = [NSString stringWithFormat:@"Conlaturations! You guessed the word %@!", [Singleton sharedObject].wordToGuess];
    } else if(![Singleton sharedObject].validAnswer){
        _Description.text = [NSString stringWithFormat:@"%@%c%@", @"You already guessed ", [Singleton sharedObject].guess, @"for this word."];
    } else if([Singleton sharedObject].correctAnswer){
        if([Singleton sharedObject].numFound == 1){
            _Description.text = [NSString stringWithFormat:@"%@%c%s", @"There is 1 ",  [Singleton sharedObject].guess, " in this word."];
        } else {
            _Description.text = [NSString stringWithFormat:@"%@%@%s%c%s", @"There are ", [@([Singleton sharedObject].numFound) stringValue], " ", [Singleton sharedObject].guess, " in this word."];
        }
    } else {
        _Description.text = @"Your guess is incorrect.";
    }
}

@end
