//
//  ViewController.h
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/17/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *Letter1;
@property (nonatomic, strong) IBOutlet UILabel *Letter2;
@property (nonatomic, strong) IBOutlet UILabel *Letter3;
@property (nonatomic, strong) IBOutlet UILabel *Letter4;
@property (nonatomic, strong) IBOutlet UILabel *Letter5;
@property (nonatomic, strong) IBOutlet UILabel *Letter6;
@property (nonatomic, strong) IBOutlet UILabel *Letter7;
@property (nonatomic, strong) IBOutlet UILabel *Letter8;
@property (nonatomic, strong) IBOutlet UILabel *Letter9;
@property (nonatomic, strong) IBOutlet UILabel *Letter10;
@property (nonatomic, strong) IBOutlet UILabel *Letter11;
@property (nonatomic, strong) IBOutlet UILabel *Letter12;
@property (nonatomic, strong) IBOutlet UILabel *Letter13;
@property (nonatomic, strong) IBOutlet UILabel *Letter14;
@property (nonatomic, strong) IBOutlet UILabel *Letter15;
@property (nonatomic, strong) IBOutlet UILabel *Letter16;
@property (nonatomic, strong) IBOutlet UILabel *Letter17;
@property (nonatomic, strong) IBOutlet UILabel *Letter18;
@property (nonatomic, strong) IBOutlet UILabel *Letter19;
@property (nonatomic, strong) IBOutlet UILabel *Letter20;
@property (nonatomic, strong) IBOutlet UILabel *Letter21;
@property (nonatomic, strong) IBOutlet UILabel *Letter22;

@property (nonatomic, strong) IBOutlet UIImageView *Dash1;
@property (nonatomic, strong) IBOutlet UIImageView *Dash2;
@property (nonatomic, strong) IBOutlet UIImageView *Dash3;
@property (nonatomic, strong) IBOutlet UIImageView *Dash4;
@property (nonatomic, strong) IBOutlet UIImageView *Dash5;
@property (nonatomic, strong) IBOutlet UIImageView *Dash6;
@property (nonatomic, strong) IBOutlet UIImageView *Dash7;
@property (nonatomic, strong) IBOutlet UIImageView *Dash8;
@property (nonatomic, strong) IBOutlet UIImageView *Dash9;
@property (nonatomic, strong) IBOutlet UIImageView *Dash10;
@property (nonatomic, strong) IBOutlet UIImageView *Dash11;
@property (nonatomic, strong) IBOutlet UIImageView *Dash12;
@property (nonatomic, strong) IBOutlet UIImageView *Dash13;
@property (nonatomic, strong) IBOutlet UIImageView *Dash14;
@property (nonatomic, strong) IBOutlet UIImageView *Dash15;
@property (nonatomic, strong) IBOutlet UIImageView *Dash16;
@property (nonatomic, strong) IBOutlet UIImageView *Dash17;
@property (nonatomic, strong) IBOutlet UIImageView *Dash18;
@property (nonatomic, strong) IBOutlet UIImageView *Dash19;
@property (nonatomic, strong) IBOutlet UIImageView *Dash20;
@property (nonatomic, strong) IBOutlet UIImageView *Dash21;
@property (nonatomic, strong) IBOutlet UIImageView *Dash22;

@property (nonatomic, strong) IBOutlet UITextField *Guess;

@property (nonatomic, strong) IBOutlet UIButton *PlayAgainButton;

@property (nonatomic, strong) IBOutlet UIImageView *bodyHead;
@property (nonatomic, strong) IBOutlet UIImageView *bodyTorso;
@property (nonatomic, strong) IBOutlet UIImageView *bodyLeftArm;
@property (nonatomic, strong) IBOutlet UIImageView *bodyLeftLeg;
@property (nonatomic, strong) IBOutlet UIImageView *bodyRightArm;
@property (nonatomic, strong) IBOutlet UIImageView *bodyRightLeg;

@property (nonatomic, strong) IBOutlet UILabel* usedLettersLabel;

@property NSMutableArray* usedLetters;

@end

