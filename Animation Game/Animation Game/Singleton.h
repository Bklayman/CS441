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

@property int x1;
@property int x2;
@property int y1;
@property int y2;
@property int flyx;
@property int flyy;

@end
