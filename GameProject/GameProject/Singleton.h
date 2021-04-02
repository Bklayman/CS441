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

@property NSMutableArray* playerExists;

@property NSMutableArray* playerNames;

@property NSMutableArray* playerWords;

@property NSMutableArray* playerPoints;

@property char roundLetter;
@property NSString* roundCategory;

@end
