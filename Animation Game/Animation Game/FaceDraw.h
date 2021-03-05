//
//  FaceDraw.h
//  Animation Game
//
//  Created by Brendan Klayman on 3/1/21.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaceDraw : UIView

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;

@property (nonatomic, strong) IBOutlet UILabel* catchFly;

@property (nonatomic, strong) IBOutlet UIButton* nextFlyButton;

@end

NS_ASSUME_NONNULL_END
