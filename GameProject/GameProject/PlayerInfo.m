//
//  ViewController.m
//  GameProject
//
//  Created by Brendan Klayman on 3/22/21.
//

#import "PlayerInfo.h"

@interface PlayerInfo ()

@end

@implementation PlayerInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self enableCheckBoxes];
}


//Based on https://stackoverflow.com/questions/17120476/click-event-on-uiimageview-programmatically-in-ios
- (void)enableCheckBoxes{
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.numberOfTapsRequired = 1;
    [_checkBox3 setUserInteractionEnabled:YES];
    [_checkBox3 addGestureRecognizer:singleTap];
    [_checkBox4 setUserInteractionEnabled:YES];
    [_checkBox4 addGestureRecognizer:singleTap];
    [_checkBox5 setUserInteractionEnabled:YES];
    [_checkBox5 addGestureRecognizer:singleTap];
    [_checkBox6 setUserInteractionEnabled:YES];
    [_checkBox6 addGestureRecognizer:singleTap];
}

- (IBAction)checkBox3Clicked:(id)sender{
    
}

@end
