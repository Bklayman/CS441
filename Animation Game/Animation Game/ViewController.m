//
//  ViewController.m
//  Animation Game
//
//  Created by Brendan Klayman on 3/1/21.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)nextFlyButtonClicked:(id)sender{
    [self moveFly];
}

- (void)moveFly{
    int randx = arc4random_uniform(327) + 16;
    int randy = arc4random_uniform(283) + 480;
    _fly.center = CGPointMake(randx, randy);
    [Singleton sharedObject].flyx = randx + 33 - 16;
    [Singleton sharedObject].flyy = randy + 36 - 480;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moveFly];
}


@end
