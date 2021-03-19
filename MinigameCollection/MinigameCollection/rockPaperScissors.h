//
//  rockPaperScissors.h
//  MinigameCollection
//
//  Created by Brendan Klayman on 3/19/21.
//

#ifndef rockPaperScissors_h
#define rockPaperScissors_h

#import <UIKit/UIKit.h>

@interface rockPaperScissors : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView* playerHand;
@property (nonatomic, strong) IBOutlet UIImageView* opponentHand;

@property (nonatomic, strong) IBOutlet UILabel* numPoints;

@property int AIIndex;
@property int playerChoice;
@property int opponentChoice;

@end

#endif /* rockPaperScissors_h */
