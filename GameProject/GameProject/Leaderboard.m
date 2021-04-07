//
//  Leaderboard.m
//  GameProject
//
//  Created by Brendan Klayman on 4/2/21.
//

#import "Singleton.h"
#import "Leaderboard.h"

@interface Leaderboard ()

@end

@implementation Leaderboard

- (void)viewDidLoad{
    [super viewDidLoad];
    [_leaderboardTable setDelegate:self];
    [_leaderboardTable setDataSource:self];
    _leaderboardData = [[NSMutableArray alloc] init];
    _leaderboardNames = [[NSMutableArray alloc] init];
    _leaderboardPoints = [[NSMutableArray alloc] init];
    [self getSaveData];
    [self addCurrentPlayers];
    [_leaderboardTable reloadData];
    [self saveLeaderboard];
}

- (nonnull UITableViewCell*)tableView:(nonnull UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    [[cell textLabel] setText:[_leaderboardData objectAtIndex:[indexPath row]]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [_leaderboardData count];
}

- (void)addCurrentPlayers{
    for(int i = 0; i < [[Singleton sharedObject].playerNames count]; i++){
        if(i > 1 && ![Singleton sharedObject].playerExists[i - 2]){
            continue;
        }
        bool nameExists = FALSE;
        int nameFound = -1;
        for(int j = 0; j < [_leaderboardNames count]; j++){
            if([_leaderboardNames[j] isEqualToString:[Singleton sharedObject].playerNames[i]]){
                nameExists = TRUE;
                nameFound = j;
                break;
            }
        }
        if(nameExists){
            _leaderboardPoints[nameFound] = [Singleton sharedObject].playerPoints[i];
            [self moveToCorrectPosition:nameFound];
        } else {
            if(_leaderboardPoints[[_leaderboardPoints count] - 1] >= [Singleton sharedObject].playerPoints[i]){
                break;
            }
            bool placed = FALSE;
            int placeAt = 0;
            for(int j = 1; j < [_leaderboardPoints count]; j++){
                if([Singleton sharedObject].playerPoints[i] < _leaderboardPoints[j]){
                    placeAt = j - 1;
                    placed = TRUE;
                    break;
                }
            }
            [self insertNewPoints:placeAt :i];
        }
    }
}

- (void)insertNewPoints:(int)leaderboardIndex :(int)playerIndex{
    NSString* playerName = [Singleton sharedObject].playerNames[playerIndex];
    NSNumber* playerPoints = [Singleton sharedObject].playerPoints[playerIndex];
    while(leaderboardIndex < [_leaderboardNames count]){
        NSString* curLeaderboardName = _leaderboardNames[leaderboardIndex];
        NSNumber* curLeaderboardPoints = _leaderboardPoints[leaderboardIndex];
        _leaderboardNames[leaderboardIndex] = playerName;
        _leaderboardPoints[leaderboardIndex] = playerPoints;
        playerName = curLeaderboardName;
        playerPoints = curLeaderboardPoints;
        leaderboardIndex++;
    }
}

- (void)moveToCorrectPosition:(int)index{
    while(index != 0 && _leaderboardPoints[index - 1] < _leaderboardPoints[index]){
        NSNumber* indexPoints = _leaderboardPoints[index];
        NSString* indexName = _leaderboardNames[index];
        _leaderboardPoints[index] = _leaderboardPoints[index - 1];
        _leaderboardNames[index] = _leaderboardNames[index - 1];
        _leaderboardPoints[index - 1] = indexPoints;
        _leaderboardNames[index - 1] = indexName;
    }
}

- (void)saveLeaderboard{
    [self createSaveDataString];
    [[NSUserDefaults standardUserDefaults] setObject:_saveData forKey:@"saveData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)createSaveDataString{
    _saveData = [NSString stringWithFormat:@""];
    for(int i = 0; i < [_leaderboardData count]; i++){
        [_saveData stringByAppendingFormat:_leaderboardData[i]];
    }
}

- (void)getSaveData{
    _saveData = [[NSUserDefaults standardUserDefaults] stringForKey:@"saveData"];
    if(_saveData == (id)[NSNull null] || _saveData.length == 0){
        _leaderboardData = [NSMutableArray arrayWithObjects:@"Magnolia: 1", @"Kukui: 2", @"Sycamore: 3", @"Juniper: 4", @"Rowan: 5", @"Birch: 6", @"Elm: 7", @"Oak: 8", @"Maple: 9", @"Laurel: 10", nil];
    } else {
        int startingIndex = 0;
        for(int i = 0; i < 10; i++){
            NSRange foundRange = [_saveData rangeOfString:@"102938" options:NSCaseInsensitiveSearch range:NSMakeRange(startingIndex, _saveData.length - startingIndex)];
            [_leaderboardData addObject:[_saveData substringWithRange:NSMakeRange(startingIndex, foundRange.location)]];
            startingIndex = (int)foundRange.location + 1;
        }
    }
    [self formatSaveData];
}

- (void)formatSaveData{
    for(int i = 0; i < [_leaderboardData count]; i++){
        NSString* curDataString = _leaderboardData[i];
        unsigned long pointsFound = [curDataString rangeOfString:@": "].location;
        while([curDataString rangeOfString:@": " options:NSCaseInsensitiveSearch range:NSMakeRange(pointsFound + 1, curDataString.length - pointsFound - 1)].location > 0){
            pointsFound = [curDataString rangeOfString:@": " options:NSCaseInsensitiveSearch range:NSMakeRange(pointsFound + 1, curDataString.length - pointsFound - 1)].location;
        }
        int curPoints = [[curDataString substringWithRange:NSMakeRange(pointsFound + 2, curDataString.length - pointsFound - 2)] intValue];
        NSString* curName = [curDataString substringWithRange:NSMakeRange(0, pointsFound)];
        [_leaderboardPoints addObject:[NSNumber numberWithInt:curPoints]];
        [_leaderboardNames addObject:curName];
    }
}

@end
