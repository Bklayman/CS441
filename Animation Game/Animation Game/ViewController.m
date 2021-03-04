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

int points = 0;

- (void)slashDone{
    if([Singleton sharedObject].y1 == [Singleton sharedObject].y2){
        //TODO find whether this hits the fly
    } else {
        int tolerance = 10;
        double slope = (double)abs([Singleton sharedObject].y2 - [Singleton sharedObject].y1) / (double)abs([Singleton sharedObject].x2 - [Singleton sharedObject].x1);
        double directHitY = ((double)[Singleton sharedObject].y1) + slope * ([Singleton sharedObject].flyx - [Singleton sharedObject].x1);
        if(fabs(directHitY - ([Singleton sharedObject].flyy)) < tolerance){
            points++;
            _points.text = [@(points) stringValue];
            [self moveFly];
        }
    }
    
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
