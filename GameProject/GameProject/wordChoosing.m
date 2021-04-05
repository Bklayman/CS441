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
    [_turnOrder removeAllObjects];
    [_turnOrderNums removeAllObjects];
    [_enteredWord addTarget:self action:@selector(resignResponder:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _turnOrder = [[NSMutableArray alloc] init];
    _turnOrderNums = [[NSMutableArray alloc] init];
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
    [Singleton sharedObject].playerWords[[_turnOrderNums[_curTurn - 1] intValue]] = _enteredWord.text;
    _enteredWord.text = @"";
    if(_curTurn == [_turnOrder count]){
        _nextScreen.hidden = FALSE;
        _submitWord.hidden = TRUE;
    } else {
        [self startTurn: _curTurn];
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
            [_turnOrder addObject:[Singleton sharedObject].playerNames[playersToPick[chosenPlayer] - 1]];
            [_turnOrderNums addObject:[NSNumber numberWithInt:playersToPick[chosenPlayer] - 1]];
            playersToPick[chosenPlayer] = -1;
            unrandomizedPlayers--;
        }
    }
}

- (IBAction)resignResponder:(id)sender{
    [sender resignFirstResponder];
}

@end
