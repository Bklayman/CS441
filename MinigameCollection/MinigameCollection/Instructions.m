//
//  Instructions.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 4/1/21.
//

#include "Instructions.h"
#include "Singleton.h"

@interface Instructions ()

@end

@implementation Instructions

-(void)viewDidLoad{
    [super viewDidLoad];
    [self showInstructions];
}

- (void)showInstructions{
    switch([Singleton sharedObject].gameSource){
            //TODO
    }
}

@end
