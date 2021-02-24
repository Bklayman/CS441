//
//  Singleton.h
//  Switching Screens Game
//
//  Created by Brendan Klayman on 2/24/21.
//

//https://riptutorial.com/objective-c/example/3258/singleton-class

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
}

+ (Singleton*) sharedObject;

@property NSString *commonString;

@end
