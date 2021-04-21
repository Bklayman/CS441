//
//  TicTacToe.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 4/21/21.
//

#import <Foundation/Foundation.h>
#import "TicTacToe.h"
#import "Singleton.h"

@interface TicTacToe ()

@end

@implementation TicTacToe

NSMutableArray* board;
int turnsTaken;
bool turn; //true -> X, false -> O

- (void)viewDidLoad{
    [super viewDidLoad];
    board = [[NSMutableArray alloc] init];
    turnsTaken = 0;
    for(int i = 1; i < 10; i++){
        [self getLetterLabel:i].text = @"";
        [board addObject:[NSNumber numberWithInt:-1]];
    }
}

- (int)checkBoardForWin{
    if(turnsTaken < 3){
        return -1;
    }
    for(int i = 0; i < 3; i++){
        if([board[i] intValue] != -1 && [board[i] intValue] == [board[i + 3] intValue] && [board[i] intValue] == [board[i + 6] intValue]){
            return [board[i] intValue];
        }
        if([board[i * 3] intValue] != -1 && [board[i * 3] intValue] == [board[i * 3 + 1] intValue] && [board[i * 3] intValue] == [board[i * 3 + 2] intValue]){
            return [board[i * 3] intValue];
        }
    }
    if([board[0] intValue] != -1 && [board[0] intValue] == [board[4] intValue] && [board[0] intValue] == [board[8] intValue]){
        return [board[0] intValue];
    }
    if([board[2] intValue] != -1 && [board[2] intValue] == [board[4] intValue] && [board[2] intValue] == [board[6] intValue]){
        return [board[0] intValue];
    }
    return -1;
}

- (UILabel*)getLetterLabel:(int)index{
    switch(index){
        case 1:
            return _letter1;
        case 2:
            return _letter2;
        case 3:
            return _letter3;
        case 4:
            return _letter4;
        case 5:
            return _letter5;
        case 6:
            return _letter6;
        case 7:
            return _letter7;
        case 8:
            return _letter8;
        case 9:
            return _letter9;
    }
    return NULL;
}

@end
