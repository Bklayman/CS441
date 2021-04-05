//
//  Blackjack.h
//  MinigameCollection
//
//  Created by Brendan Klayman on 4/1/21.
//

#ifndef Blackjack_h
#define Blackjack_h

#import <UIKit/UIKit.h>

@interface Blackjack : UIViewController

@property (nonatomic, strong) IBOutlet UIButton* splitButton;

@property (nonatomic, strong) IBOutlet UIImageView* playerCard1;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard2;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard3;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard4;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard5;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard6;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard7;
@property (nonatomic, strong) IBOutlet UIImageView* playerCard8;

@property (nonatomic, strong) IBOutlet UIImageView* opponentCard1;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard2;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard3;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard4;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard5;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard6;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard7;
@property (nonatomic, strong) IBOutlet UIImageView* opponentCard8;

@end

#endif /* Blackjack_h */
