//
//  Singleton.m
//  GameProject
//
//  Created by Brendan Klayman on 3/24/21.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@implementation Singleton

+ (Singleton*)sharedObject{
    static Singleton *sharedClass = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClass = [[self alloc] init];
    });
    return sharedClass;
}

- (id)init{
    if(self = [super init]){
        _playerExists = [[NSMutableArray alloc] init];
        for(int i = 0; i < 4; i++){
            [_playerExists addObject:[NSNumber numberWithBool:FALSE]];
        }
        _playerNames = [[NSMutableArray alloc] init];
        for(int i = 0; i < 6; i++){
            [_playerNames addObject:@""];
        }
        _roundLetter = @'Q';
        _roundCategory = @"";
        _playerWords = [[NSMutableArray alloc] init];
        for(int i = 0; i < 6; i++){
            [_playerWords addObject:@""];
        }
        _playerPoints = [[NSMutableArray alloc] init];
        for(int i = 0; i < 6; i++){
            [_playerNames addObject:[NSNumber numberWithInt:0]];
        }
    }
    return self;
}

@end
