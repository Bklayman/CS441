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
    _turnOrder = [[NSMutableArray alloc] init];
    _nextScreen.hidden = TRUE;
    _submitWord.hidden = FALSE;
    [self createTurnOrder];
    _curTurn = 0;
    [self startTurn: _curTurn];
}

- (NSString*)getPlayerName:(int)index {
    switch(index){
        case 1:
            return [Singleton sharedObject].player1Name;
        case 2:
            return [Singleton sharedObject].player2Name;
        case 3:
            return [Singleton sharedObject].player3Name;
        case 4:
            return [Singleton sharedObject].player4Name;
        case 5:
            return [Singleton sharedObject].player5Name;
        case 6:
            return [Singleton sharedObject].player6Name;
    }
    return NULL;
}

- (void)startTurn:(int)index {
    _namePresented.text = [NSString stringWithFormat:@"%@'s Word:", [_turnOrder objectAtIndex:index]];
}

- (IBAction)nextTurn:(id)sender{
    _curTurn++;
    _enteredWord.text = [_enteredWord.text stringByReplacingOccurrencesOfString:@" " withString:@""]; //TODO Change later to only delete preceding and proceding spaces
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
            [Singleton sharedObject].player1Word = word;
            break;
        case 2:
            [Singleton sharedObject].player2Word = word;
            break;
        case 3:
            [Singleton sharedObject].player3Word = word;
            break;
        case 4:
            [Singleton sharedObject].player4Word = word;
            break;
        case 5:
            [Singleton sharedObject].player5Word = word;
            break;
        case 6:
            [Singleton sharedObject].player6Word = word;
            break;
    }
}

- (void)createTurnOrder {
    int playersToPick[6];
    int unrandomizedPlayers = 2;
    playersToPick[0] = 1;
    playersToPick[1] = 2;
    if([Singleton sharedObject].player3Exists){
        playersToPick[2] = 3;
        unrandomizedPlayers++;
    } else {
        playersToPick[2] = -1;
    }
    if([Singleton sharedObject].player4Exists){
        playersToPick[3] = 4;
        unrandomizedPlayers++;
    } else {
        playersToPick[3] = -1;
    }
    if([Singleton sharedObject].player5Exists){
        playersToPick[4] = 5;
        unrandomizedPlayers++;
    } else {
        playersToPick[4] = -1;
    }
    if([Singleton sharedObject].player6Exists){
        playersToPick[5] = 6;
        unrandomizedPlayers++;
    } else {
        playersToPick[5] = -1;
    }
    while(unrandomizedPlayers > 0){
        int chosenPlayer = arc4random_uniform(6);
        if(playersToPick[chosenPlayer] != -1){
            [_turnOrder addObject:[self getPlayerName:playersToPick[chosenPlayer]]];
            playersToPick[chosenPlayer] = -1;
            unrandomizedPlayers--;
        }
    }
}

@end
