//
//  Singleton.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/26/21.
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
        self.gaveAnswer = FALSE;
        self.correctAnswer = FALSE;
        self.validAnswer = TRUE;
        self.gameOver = FALSE;
        self.winGame = FALSE;
    }
    return self;
}

@end
