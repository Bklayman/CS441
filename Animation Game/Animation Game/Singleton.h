//
//  Singleton.h
//  Animation Game
//
//  Created by Brendan Klayman on 3/3/21.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
}

+ (Singleton*) sharedObject;

@property int points;

@end
