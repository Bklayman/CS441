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

- (void)slashDone{
    if([Singleton sharedObject].y1 == [Singleton sharedObject].y1){
        //TODO find whether this hits the fly
    } else {
        double slope = abs([Singleton sharedObject].y2 - [Singleton sharedObject].y1) / abs([Singleton sharedObject].x2 - [Singleton sharedObject].x1);
        //TODO find whether this hits the fly
    }
    
}

- (void)moveFly{
    int randx = arc4random_uniform(82) + 16;
    int randy = arc4random_uniform(380) + 480;
    [_fly setFrame:CGRectMake(randx, randy, _fly.frame.size.width, _fly.frame.size.height)];
    [Singleton sharedObject].flyx = randx;
    [Singleton sharedObject].flyy = randy;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
