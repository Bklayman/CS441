//
//  Singleton.m
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/10/21.
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
        self.colors = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
