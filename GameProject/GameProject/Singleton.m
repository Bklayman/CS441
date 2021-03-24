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
        _player3Exists = FALSE;
        _player4Exists = FALSE;
        _player5Exists = FALSE;
        _player6Exists = FALSE;
        _player1Name = @"";
        _player2Name = @"";
        _player3Name = @"";
        _player4Name = @"";
        _player5Name = @"";
        _player6Name = @"";
        _roundLetter = @'Q';
        _roundCategory = @"";
    }
    return self;
}

@end
