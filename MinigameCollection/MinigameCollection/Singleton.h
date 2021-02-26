//
//  Singleton.h
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/26/21.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
}

+ (Singleton*) sharedObject;

@property BOOL gaveAnswer;
@property BOOL correctAnswer;
@property int numFound;

@end
