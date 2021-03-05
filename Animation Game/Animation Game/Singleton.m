//
//  Singleton.m
//  Animation Game
//
//  Created by Brendan Klayman on 3/3/21.
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
        self.x1 = 0;
        self.y1 = 0;
        self.x2 = 0;
        self.x2 = 0;
        self.flyx = 0;
        self.flyy = 0;
        self.points = 0;
    }
    return self;
}

@end
