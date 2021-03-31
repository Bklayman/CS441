//
//  WordChecker.h
//  GameProject
//
//  Created by Brendan Klayman on 3/29/21.
//

#import <UIKit/UIKit.h>

@interface WordChecker: UIViewController

@property (nonatomic, strong) IBOutlet UIImageView* checkBox1;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox2;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox3;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox4;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox5;
@property (nonatomic, strong) IBOutlet UIImageView* checkBox6;

@property (nonatomic, strong) IBOutlet UIImageView* check1;
@property (nonatomic, strong) IBOutlet UIImageView* check2;
@property (nonatomic, strong) IBOutlet UIImageView* check3;
@property (nonatomic, strong) IBOutlet UIImageView* check4;
@property (nonatomic, strong) IBOutlet UIImageView* check5;
@property (nonatomic, strong) IBOutlet UIImageView* check6;

@property (nonatomic, strong) IBOutlet UITextField* player1Word;
@property (nonatomic, strong) IBOutlet UITextField* player2Word;
@property (nonatomic, strong) IBOutlet UITextField* player3Word;
@property (nonatomic, strong) IBOutlet UITextField* player4Word;
@property (nonatomic, strong) IBOutlet UITextField* player5Word;
@property (nonatomic, strong) IBOutlet UITextField* player6Word;

@property (nonatomic, strong) IBOutlet UILabel* player1Name;
@property (nonatomic, strong) IBOutlet UILabel* player2Name;
@property (nonatomic, strong) IBOutlet UILabel* player3Name;
@property (nonatomic, strong) IBOutlet UILabel* player4Name;
@property (nonatomic, strong) IBOutlet UILabel* player5Name;
@property (nonatomic, strong) IBOutlet UILabel* player6Name;

@end
