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
    [self moveBlock];
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

- (BOOL)checkSpacedOut:(int)index{ //Index 0 -> block, 1 -> poison1, 2 -> poison2
    int xCoords[4];
    int yCoords[4];
    xCoords[0] = _block.center.x;
    yCoords[0] = _block.center.y;
    xCoords[1] = _poison1.center.x;
    yCoords[1] = _poison1.center.y;
    xCoords[2] = _poison2.center.x;
    yCoords[2] = _poison2.center.y;
    xCoords[3] = _player.center.x;
    yCoords[3] = _player.center.y;
    for(int i = 0; i < 4; i++){
        if(i != index && abs(xCoords[index] - xCoords[i]) < 50 && abs(yCoords[index] - yCoords[i]) < 50){
            return FALSE;
        }
    }
    return TRUE;
}

- (void)moveBlock{
    _block.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    _poison1.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    _poison2.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    while(![self checkSpacedOut:0]){
        _block.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    }
    while(![self checkSpacedOut:1]){
        _poison1.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    }
    while(![self checkSpacedOut:2]){
        _poison2.center = CGPointMake(arc4random_uniform(250) + 50, arc4random_uniform(500) + 200);
    }
}

- (void)checkForPoint{
    if(fabs(_poison2.center.x - _player.center.x) < 30 && fabs(_poison2.center.y - _player.center.y) < 70){
        _points-= 2;
        _numPoints.text = [NSString stringWithFormat:@"%d", _points];
        [self moveBlock];
    } else if(fabs(_poison1.center.x - _player.center.x) < 30 && fabs(_poison1.center.y - _player.center.y) < 70){
        _points-= 2;
        _numPoints.text = [NSString stringWithFormat:@"%d", _points];
        [self moveBlock];
    } else if(fabs(_block.center.x - _player.center.x) < 50 && fabs(_block.center.y - _player.center.y) < 50){
        _points++;
        _numPoints.text = [NSString stringWithFormat:@"%d", _points];
        [self moveBlock];
    }
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
