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
    [self calculatePoints];
}

- (NSString*)getPlayerGuesses:(int)index{
    switch(index){
        case 0:
            return [Singleton sharedObject].playerWords[0];
        case 1:
            return [Singleton sharedObject].playerWords[1];
        case 2:
            return [Singleton sharedObject].playerWords[2];
        case 3:
            return [Singleton sharedObject].playerWords[3];
        case 4:
            return [Singleton sharedObject].playerWords[4];
        case 5:
            return [Singleton sharedObject].playerWords[5];
        default:
            return @"";
    }
}

- (int)getPlayerPoints:(int)index{
    switch(index){
        default:
            return -1;
    }
}

- (void)calculatePoints{
    
}

@end
