//
//  ViewController.h
//  API_Game
//
//  Created by Brendan Klayman on 3/16/21.
//

#import <CoreMotion/CoreMotion.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* numPoints;

@property int points;

@property (nonatomic, strong) IBOutlet UIImageView* block;
@property (nonatomic, strong) IBOutlet UIImageView* player;
@property (nonatomic, strong) IBOutlet UIImageView* poison1;
@property (nonatomic, strong) IBOutlet UIImageView* poison2;

@property CMMotionManager* motionManager;

@end

