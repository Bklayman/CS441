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
    //TODO
}

- (IBAction)nextTurn:(id)sender{
    _curTurn++;
    if(_curTurn == [_turnOrder count]){
        
    } else {
        [self startTurn: _curTurn];
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
