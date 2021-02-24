//
//  ViewController.m
//  Switching Screens Game
//
//  Created by Brendan Klayman on 2/22/21.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

int livesLeft = 3;
int level = 4;
int intsToGuess[10];
bool started = FALSE;

- (void)gameOver{
    started = FALSE;
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
        if([guess characterAtIndex:i] != ascii0 + intsToGuess[i] - 1){
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
    _guessText.hidden = TRUE;
    _guessButton.hidden = TRUE;
    _startButton.hidden = FALSE;
}

- (void)setNumImages{
    for(int i = 0; i < level; i++){
        
    }
}

- (IBAction)startButtonClicked:(id)sender{
    if(livesLeft == 0 || !started){
        livesLeft = 3;
        level = 4;
        for(int i = 0; i < level; i++){
            intsToGuess[i] = arc4random_uniform(level);
        }
        started = TRUE;
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
