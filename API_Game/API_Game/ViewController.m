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
}

- (void)movePlayer:(int)x :(int)y {
    int curXPos = _player.center.x;
    int curYPos = _player.center.y;
    int nextX = 0;
    int nextY = 0;
    if(x < 0){
        if(curXPos + x < 50){
            nextX = 50;
        } else {
            nextX = curXPos + x;
        }
    } else {
        if(curXPos + x > 300){
            nextX = 300;
        } else {
            nextX = curXPos + x;
        }
    }
    if(y < 0){
        if(curYPos + y < 200){
            nextY = 200;
        } else {
            nextY = curYPos + y;
        }
    } else {
        if(curYPos + y > 700){
            nextY = 700;
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
                int xChange = [[[NSString alloc] initWithFormat:@"%.02f", gyroData.rotationRate.y] floatValue] * 3;
                int yChange = [[[NSString alloc] initWithFormat:@"%.02f", gyroData.rotationRate.x] floatValue] * 3;
                [self movePlayer:xChange :yChange];
                [self checkForPoint];
            }];
        }
    } else {
        NSLog(@"Gyroscope not avaliable.");
    }
}

- (IBAction)centerButtonClicked:(id)sender{
    _player.center = CGPointMake(175, 350);
}

- (IBAction)saveButtonClicked:(id)sender{
    NSString* saveData = [NSString stringWithFormat:@"%@", _numPoints.text];
    [[NSUserDefaults standardUserDefaults] setObject:saveData forKey:@"saveData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)loadButtonClicked:(id)sender{
    NSString* saveData = [[NSUserDefaults standardUserDefaults] stringForKey:@"saveData"];
    _numPoints.text = saveData;
    _points = [saveData intValue];
}

- (enum UIInterfaceOrientationMask) supportedInterfaceOrientations {
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
