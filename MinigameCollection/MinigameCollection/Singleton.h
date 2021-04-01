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

//Hangman
@property BOOL correctAnswer;
@property int numFound;
@property char guess;
@property BOOL gaveAnswer;
@property BOOL validAnswer;
@property NSString* wordToGuess;
@property BOOL gameOver;
@property BOOL winGame;

//Instructions
@property int gameSource;

@end
