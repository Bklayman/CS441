//
//  ViewController.h
//  Switching Screens Game
//
//  Created by Brendan Klayman on 2/22/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel* livesRemaining;
@property (nonatomic, strong) IBOutlet UILabel* introduction;
@property (nonatomic, strong) IBOutlet UILabel* level;

@property (nonatomic, strong) IBOutlet UIButton* startButton;
@property (nonatomic, strong) IBOutlet UIButton* guessButton;

@property (nonatomic, strong) IBOutlet UITextField* guessText;

@end

