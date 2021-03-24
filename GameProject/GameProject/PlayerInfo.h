//
//  ViewController.h
//  GameProject
//
//  Created by Brendan Klayman on 3/22/21.
//

#import <UIKit/UIKit.h>

@interface PlayerInfo: UIViewController

@property (nonatomic, strong) IBOutlet UIImageView* checkBox3;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox4;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox5;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox6;

@property (nonatomic, strong) IBOutlet UIImageView* check3;
@property (nonatomic, strong) IBOutlet UIImageView* check4;
@property (nonatomic, strong) IBOutlet UIImageView* check5;
@property (nonatomic, strong) IBOutlet UIImageView* check6;

@property (nonatomic, strong) IBOutlet UITextField* player1Name;
@property (nonatomic, strong) IBOutlet UITextField* player2Name;
@property (nonatomic, strong) IBOutlet UITextField* player3Name;
@property (nonatomic, strong) IBOutlet UITextField* player4Name;
@property (nonatomic, strong) IBOutlet UITextField* player5Name;
@property (nonatomic, strong) IBOutlet UITextField* player6Name;

@property (nonatomic, strong) IBOutlet UIButton* startGameButton;

@end

