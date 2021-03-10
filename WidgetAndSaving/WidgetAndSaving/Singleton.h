//
//  Singleton.h
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/10/21.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
}

+ (Singleton*) sharedObject;

@property NSMutableArray* colors;

@end
