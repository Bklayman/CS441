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
    [self updateLeaderboardData];
    [_leaderboardTable reloadData];
    [self saveLeaderboard];
}

- (void)updateLeaderboardData{
    for(int i = 0; i < [_leaderboardNames count]; i++){
        _leaderboardData[i] = [NSString stringWithFormat:@"%@%@%d", _leaderboardNames[i], @": ", [_leaderboardPoints[i] intValue]];
    }
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
    for(int i = 0; i < 6; i++){
        if(i > 1 && i < 6 && ![[Singleton sharedObject].playerExists[i - 2] boolValue]){
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
            if([_leaderboardPoints[nameFound] intValue] < [[Singleton sharedObject].playerPoints[i] intValue]){
                _leaderboardPoints[nameFound] = [Singleton sharedObject].playerPoints[i];
                [self moveToCorrectPosition:nameFound];
            }
        } else {
            if([_leaderboardPoints[0] intValue] >= [[Singleton sharedObject].playerPoints[i] intValue]){
                continue;
            }
            bool placed = FALSE;
            int placeAt = 0;
            for(int j = 1; j < [_leaderboardPoints count]; j++){
                if([[Singleton sharedObject].playerPoints[i] intValue] < [_leaderboardPoints[j] intValue]){
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
    while(leaderboardIndex >= 0){
        NSString* curLeaderboardName = _leaderboardNames[leaderboardIndex];
        NSNumber* curLeaderboardPoints = _leaderboardPoints[leaderboardIndex];
        _leaderboardNames[leaderboardIndex] = playerName;
        _leaderboardPoints[leaderboardIndex] = playerPoints;
        playerName = curLeaderboardName;
        playerPoints = curLeaderboardPoints;
        leaderboardIndex--;
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
    _saveData = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", _leaderboardData[0], @"102938", _leaderboardData[1], @"102938", _leaderboardData[2], @"102938", _leaderboardData[3], @"102938", _leaderboardData[4], @"102938", _leaderboardData[5], @"102938", _leaderboardData[6], @"102938", _leaderboardData[7], @"102938", _leaderboardData[8], @"102938", _leaderboardData[9], @"102938"];
}

- (void)getSaveData{
    _saveData = [[NSUserDefaults standardUserDefaults] stringForKey:@"saveData"];
    if(_saveData == (id)[NSNull null] || _saveData.length == 0){
        _leaderboardData = [NSMutableArray arrayWithObjects:@"Magnolia: 1", @"Kukui: 2", @"Sycamore: 3", @"Juniper: 4", @"Rowan: 5", @"Birch: 6", @"Elm: 7", @"Oak: 8", @"Maple: 9", @"Laurel: 10", nil];
    } else {
        int startingIndex = 0;
        for(int i = 0; i < 10; i++){
            NSRange foundRange = [_saveData rangeOfString:@"102938" options:NSCaseInsensitiveSearch range:NSMakeRange(startingIndex, _saveData.length - startingIndex)];
            [_leaderboardData addObject:[_saveData substringWithRange:NSMakeRange(startingIndex, foundRange.location - startingIndex)]];
            startingIndex = (int)foundRange.location + 6;
        }
    }
    [self formatSaveData];
}

- (void)formatSaveData{
    for(int i = 0; i < [_leaderboardData count]; i++){
        NSString* curDataString = _leaderboardData[i];
        unsigned long pointsFound = [curDataString rangeOfString:@": "].location;
        unsigned long pointsToUse = pointsFound;
        while((int)pointsFound != -1){
            pointsToUse = pointsFound;
            pointsFound = [curDataString rangeOfString:@": " options:NSCaseInsensitiveSearch range:NSMakeRange(pointsFound + 1, curDataString.length - pointsFound - 1)].location;
        }
        int curPoints = [[curDataString substringWithRange:NSMakeRange(pointsToUse + 2, curDataString.length - pointsToUse - 2)] intValue];
        NSString* curName = [curDataString substringWithRange:NSMakeRange(0, pointsToUse)];
        [_leaderboardPoints addObject:[NSNumber numberWithInt:curPoints]];
        [_leaderboardNames addObject:curName];
    }
}

@end
