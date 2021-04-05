//
//  WordEvaluator.m
//  GameProject
//
//  Created by Brendan Klayman on 4/2/21.
//

#import "Singleton.h"
#import "WordEvaluator.h"

@interface WordEvaluator ()

@end

@implementation WordEvaluator

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addNames];
    [self showNeededPlayers];
    [self calculatePoints];
}

- (void)addNames{
    _player1Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[0], @":"];
    _player2Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[1], @":"];
    _player3Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[2], @":"];
    _player4Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[3], @":"];
    _player5Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[4], @":"];
    _player6Name.text = [NSString stringWithFormat:@"%@%@", [Singleton sharedObject].playerNames[5], @":"];
}

- (void)showNeededPlayers{
    for(int i = 0; i < 4; i++){
        if([[Singleton sharedObject].playerExists[i] boolValue] == TRUE){
            [self getPlayerName:i + 2].hidden = FALSE;
            [self getPlayerResult:i + 2].hidden = FALSE;
        } else {
            [self getPlayerName:i + 2].hidden = TRUE;
            [self getPlayerResult:i + 2].hidden = TRUE;
        }
    }
}

- (UILabel*)getPlayerResult:(int)index{
    switch(index){
        case 0:
            return _player1Result;
        case 1:
            return _player2Result;
        case 2:
            return _player3Result;
        case 3:
            return _player4Result;
        case 4:
            return _player5Result;
        case 5:
            return _player6Result;
        default:
            return NULL;
    }
}

- (UILabel*)getPlayerName:(int)index{
    switch(index){
        case 0:
            return _player1Name;
        case 1:
            return _player2Name;
        case 2:
            return _player3Name;
        case 3:
            return _player4Name;
        case 4:
            return _player5Name;
        case 5:
            return _player6Name;
        default:
            return NULL;
    }
}

- (void)calculatePoints{
    for(int i = 0; i < 6; i++){
        [Singleton sharedObject].playerWords[i] = [[Singleton sharedObject].playerWords[i] lowercaseString];
        [Singleton sharedObject].playerWords[i] = [[Singleton sharedObject].playerWords[i] stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    for(int i = 0; i < 6; i++){
        int found = 0;
        for(int j = 0; j < 6; j++){
            if([[Singleton sharedObject].playerWords[i] isEqualToString:[Singleton sharedObject].playerWords[j]]){
                found++;
            }
        }
        if([[Singleton sharedObject].playerWords[i] isEqualToString:@""] || found > 1){
            if([[Singleton sharedObject].playerWords[i] isEqualToString:@""]){
                [self getPlayerResult:i].text = [NSString stringWithFormat:@"%@%@%d%@", [Singleton sharedObject].playerWords[i], @": No word entered. Total: ", [[Singleton sharedObject].playerPoints[i] intValue], @"."];
            } else {
                [self getPlayerResult:i].text = [NSString stringWithFormat:@"%@%@%d%@", [Singleton sharedObject].playerWords[i], @": Matched with another player. Total: ", [[Singleton sharedObject].playerPoints[i] intValue], @"."];
            }
        } else {
            int curPoints = [[Singleton sharedObject].playerPoints[i] intValue];
            [Singleton sharedObject].playerPoints[i] = [NSNumber numberWithInt:(curPoints + 1)];
            [self getPlayerResult:i].text = [NSString stringWithFormat:@"%@%@%d%@", [Singleton sharedObject].playerWords[i], @": +1 Point! Total: ", curPoints + 1, @"."];
        }
    }
}

@end
