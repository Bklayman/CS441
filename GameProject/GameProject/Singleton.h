//
//  Singleton.h
//  GameProject
//
//  Created by Brendan Klayman on 3/24/21.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
}

+ (Singleton*) sharedObject;

@property bool player3Exists;
@property bool player4Exists;
@property bool player5Exists;
@property bool player6Exists;

@property NSString* player1Name;
@property NSString* player2Name;
@property NSString* player3Name;
@property NSString* player4Name;
@property NSString* player5Name;
@property NSString* player6Name;

@property char roundLetter;
@property NSString* roundCategory;

@end
