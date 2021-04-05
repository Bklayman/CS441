//
//  wordChoosing.h
//  GameProject
//
//  Created by Brendan Klayman on 3/26/21.
//

#import <UIKit/UIKit.h>

@interface wordChoosing: UIViewController

@property (nonatomic, strong) IBOutlet UITextField* enteredWord;

@property (nonatomic, strong) IBOutlet UILabel* namePresented;

@property (nonatomic, strong) IBOutlet UIButton* nextScreen;
@property (nonatomic, strong) IBOutlet UIButton* submitWord;

@property NSMutableArray* turnOrder;
@property NSMutableArray* turnOrderNums;
@property int curTurn;

@end
