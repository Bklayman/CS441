//
//  ViewController.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/17/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)playHangman:(NSArray*)hangmanWordsArray {
    int chosenWordIndex = arc4random_uniform(10000);
    NSString* chosenWord = hangmanWordsArray[chosenWordIndex]; //Player guesses this word
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* hangmanWordListPath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString* loadedWord = [NSString stringWithContentsOfFile:hangmanWordListPath               encoding:NSUTF8StringEncoding
        error:NULL];
    NSArray* hangmanWordsArray = [loadedWord componentsSeparatedByString:@"\n"];
    
    //TODO Main Menu for Choosing which Game to Play
    [self playHangman:hangmanWordsArray];
}


@end
