//
//  ViewController.m
//  API_Game
//
//  Created by Brendan Klayman on 3/16/21.
//

#import <CoreMotion/CoreMotion.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _motionManager = [[CMMotionManager alloc] init];
    [self startGyroscope];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self runGame];
    });
}

- (void)runGame {
    while(TRUE){
        int xChange = 0;
        int yChange = 0;
        [self movePlayer:xChange :yChange];
        [self checkForPoint];
        [NSThread sleepForTimeInterval:.5];
    }
}

- (void)movePlayer:(int)x :(int)y {
    int curXPos = _player.center.x;
    int curYPos = _player.center.y;
    int nextX = 0;
    int nextY = 0;
    if(x < 0){
        if(curXPos + x < 20){
            nextX = 20;
        } else {
            nextX = curXPos + x;
        }
    } else {
        if(curXPos + x > 355){
            nextX = 255;
        } else {
            nextX = curXPos + x;
        }
    }
    if(y < 0){
        if(curYPos + y < 60){
            nextY = 60;
        } else {
            nextY = curYPos + y;
        }
    } else {
        if(curYPos + y > 800){
            nextY = 800;
        } else {
            nextY = curYPos + y;
        }
    }
    _player.center = CGPointMake(nextX, nextY);
}

- (void)checkForPoint{
    //TODO
}

//Gotten from https://stackoverflow.com/questions/7135934/ios-gyroscope-api
- (void)startGyroscope {
    if([_motionManager isGyroAvailable]){
        if([_motionManager isGyroActive] == NO){
            [_motionManager setGyroUpdateInterval:1/6]; //Update 6times / 1second
            [_motionManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
                NSString* x = [[NSString alloc] initWithFormat:@"%.02f", gyroData.rotationRate.x];
                self.gyroX = x;
                NSString* y = [[NSString alloc] initWithFormat:@"%.02f", gyroData.rotationRate.y];
                self.gyroY = y;
                NSString* z = [[NSString alloc] initWithFormat:@"%.02f", gyroData.rotationRate.z];
                self.gyroZ = z;
            }];
        }
    } else {
        NSLog(@"Gyroscope not avaliable.");
    }
}

- (NSUInteger) supportedInterfaceOrientations {
    // Return a bitmask of supported orientations. If you need more,
    // use bitwise or (see the commented return).
    return UIInterfaceOrientationMaskPortrait;
    // return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation {
    // Return the orientation you'd prefer - this is what it launches to. The
    // user can still rotate. You don't have to implement this method, in which
    // case it launches in the current orientation
    return UIInterfaceOrientationPortrait;
}


@end
