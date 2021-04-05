//
//  wordChoosing.m
//  GameProject
//
//  Created by Brendan Klayman on 3/26/21.
//

#import "wordChoosing.h"
#import "Singleton.h"

@interface wordChoosing ()

@end

@implementation wordChoosing

- (void)viewDidLoad {
    [super viewDidLoad];
    [_enteredWord addTarget:self action:@selector(resignResponder:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _turnOrder = [[NSMutableArray alloc] init];
    _nextScreen.hidden = TRUE;
    _submitWord.hidden = FALSE;
    [self createTurnOrder];
    _curTurn = 0;
    [self startTurn: _curTurn];
}

- (void)startTurn:(int)index {
    _namePresented.text = [NSString stringWithFormat:@"%@'s Word:", [_turnOrder objectAtIndex:index]];
}

- (IBAction)nextTurn:(id)sender{
    _curTurn++;
    _enteredWord.text = [_enteredWord.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    [self saveWord:_enteredWord.text :_curTurn - 1];
    if(_curTurn == [_turnOrder count]){
        _nextScreen.hidden = FALSE;
        _submitWord.hidden = TRUE;
    } else {
        [self startTurn: _curTurn];
    }
}

- (void)saveWord:(NSString*)word :(int)index{
    switch(index){
        case 1:
            [Singleton sharedObject].playerNames[0] = word;
            break;
        case 2:
            [Singleton sharedObject].playerNames[1] = word;
            break;
        case 3:
            [Singleton sharedObject].playerNames[2] = word;
            break;
        case 4:
            [Singleton sharedObject].playerNames[3] = word;
            break;
        case 5:
            [Singleton sharedObject].playerNames[4] = word;
            break;
        case 6:
            [Singleton sharedObject].playerNames[5] = word;
            break;
    }
}

- (void)createTurnOrder {
    int playersToPick[6];
    int unrandomizedPlayers = 2;
    playersToPick[0] = 1;
    playersToPick[1] = 2;
    if([[Singleton sharedObject].playerExists[0] boolValue] == TRUE){
        playersToPick[2] = 3;
        unrandomizedPlayers++;
    } else {
        playersToPick[2] = -1;
    }
    if([[Singleton sharedObject].playerExists[1] boolValue] == TRUE){
        playersToPick[3] = 4;
        unrandomizedPlayers++;
    } else {
        playersToPick[3] = -1;
    }
    if([[Singleton sharedObject].playerExists[2] boolValue] == TRUE){
        playersToPick[4] = 5;
        unrandomizedPlayers++;
    } else {
        playersToPick[4] = -1;
    }
    if([[Singleton sharedObject].playerExists[3] boolValue] == TRUE){
        playersToPick[5] = 6;
        unrandomizedPlayers++;
    } else {
        playersToPick[5] = -1;
    }
    while(unrandomizedPlayers > 0){
        int chosenPlayer = arc4random_uniform(6);
        if(playersToPick[chosenPlayer] != -1){
            [_turnOrder addObject:[Singleton sharedObject].playerNames[playersToPick[chosenPlayer]]];
            playersToPick[chosenPlayer] = -1;
            unrandomizedPlayers--;
        }
    }
}

- (IBAction)resignResponder:(id)sender{
    [sender resignFirstResponder];
}

@end
