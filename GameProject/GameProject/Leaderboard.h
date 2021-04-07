//
//  Leaderboard.h
//  GameProject
//
//  Created by Brendan Klayman on 4/2/21.
//

#import <UIKit/UIKit.h>

@interface Leaderboard: UIViewController

@property NSString* saveData;

@property NSMutableArray* leaderboardData;
@property NSMutableArray* leaderboardNames;
@property NSMutableArray* leaderboardPoints;

@property (nonatomic, strong) IBOutlet UITableView* leaderboardTable;

@end

