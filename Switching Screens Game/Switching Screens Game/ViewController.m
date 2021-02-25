//
//  ViewController.m
//  Switching Screens Game
//
//  Created by Brendan Klayman on 2/22/21.
//

#import "ViewController.h"
#import "Singleton.h"


@interface ViewController ()

@end

@implementation ViewController

int livesLeft = 3;
int level = 4;
bool started = FALSE;

- (void)gameOver{
    started = FALSE;
    _introduction.text = @"Game Over. Press start to play again.";
    //TODO
}

- (IBAction)guessButtonClicked:(id)sender{
    NSString* guess = _guessText.text;
    _guessText.text = @"";
    if(guess.length != level){
        return;
    }
    int ascii0 = '0';
    bool win = TRUE;
    for(int i = 0; i < level; i++){
        if(guess.length != [Singleton sharedObject].commonString.length){
            win = FALSE;
            break;
        }
        if([guess characterAtIndex:i] != ascii0 + [[Singleton sharedObject].commonString characterAtIndex:i] - 1){
            win = FALSE;
        }
    }
    if(!win){
        livesLeft--;
        if(livesLeft == 0){
            [self gameOver];
        } else {
            level--;
        }
    } else {
        level++;
    }
    _livesRemaining.text = [@(livesLeft) stringValue];
    _level.text = [@(level) stringValue];
    _guessText.hidden = TRUE;
    _guessButton.hidden = TRUE;
    _startButton.hidden = FALSE;
}

- (IBAction)startButtonClicked:(id)sender{
    if(livesLeft == 0 || !started){
        livesLeft = 3;
        level = 4;
        _livesRemaining.text = [@(livesLeft) stringValue];
        _level.text = [@(level) stringValue];
        _introduction.text = @"Welcome to the Screen Changing Memory Game!";
        [Singleton sharedObject].commonString = [@(arc4random_uniform(pow(10.0, level))) stringValue];
        while([[Singleton sharedObject].commonString integerValue] < pow(10, level - 1)){
            [Singleton sharedObject].commonString = [@(arc4random_uniform(pow(10.0, level))) stringValue];
        }
        started = TRUE;
    } else {
        [Singleton sharedObject].commonString = [@(arc4random_uniform(pow(10.0, level))) stringValue];
        while([[Singleton sharedObject].commonString integerValue] < pow(10, level - 1)){
            [Singleton sharedObject].commonString = [@(arc4random_uniform(pow(10.0, level))) stringValue];
        }
    }
    _guessText.hidden = FALSE;
    _guessButton.hidden = FALSE;
    _startButton.hidden = TRUE;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
