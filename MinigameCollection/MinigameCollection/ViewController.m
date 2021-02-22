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

- (UIImageView*)getUIImage:(int)index{
    switch(index){
        case 1:
            return _Dash1;
        case 2:
            return _Dash2;
        case 3:
            return _Dash3;
        case 4:
            return _Dash4;
        case 5:
            return _Dash5;
        case 6:
            return _Dash6;
        case 7:
            return _Dash7;
        case 8:
            return _Dash8;
        case 9:
            return _Dash9;
        case 10:
            return _Dash10;
        case 11:
            return _Dash11;
        case 12:
            return _Dash12;
        case 13:
            return _Dash13;
        case 14:
            return _Dash14;
        case 15:
            return _Dash15;
        case 16:
            return _Dash16;
        case 17:
            return _Dash17;
        case 18:
            return _Dash18;
        case 19:
            return _Dash19;
        case 20:
            return _Dash20;
        case 21:
            return _Dash21;
        case 22:
            return _Dash22;
        default:
            return NULL;
    }
}

- (UILabel*)getUILabel:(int)index{
    switch(index){
        case 1 :
            return _Letter1;
        case 2 :
            return _Letter2;
        case 3 :
            return _Letter3;
        case 4 :
            return _Letter4;
        case 5 :
            return _Letter5;
        case 6 :
            return _Letter6;
        case 7 :
            return _Letter7;
        case 8 :
            return _Letter8;
        case 9 :
            return _Letter9;
        case 10 :
            return _Letter10;
        case 11 :
            return _Letter11;
        case 12 :
            return _Letter12;
        case 13 :
            return _Letter13;
        case 14 :
            return _Letter14;
        case 15 :
            return _Letter15;
        case 16 :
            return _Letter16;
        case 17 :
            return _Letter17;
        case 18 :
            return _Letter18;
        case 19 :
            return _Letter19;
        case 20 :
            return _Letter20;
        case 21 :
            return _Letter21;
        case 22 :
            return _Letter22;
        default :
            return NULL;
    }
}

- (NSMutableArray*)showNeededElements:(unsigned long)wordLength{
    NSMutableArray* usedLabels;
    if(wordLength < 8){ //Word length: 1-7
        for(int i = 7; i > 0; i--){
            if(i <= 7 - wordLength){
                [self getUIImage:i].hidden = NO;
                //TODO
            } else {
                //TODO
            }
        }
    } else if(wordLength < 15){ //Word length: 8-14
        //TODO
    } else { //Word length: 15-22
        //TODO
    }
    return usedLabels;
}

- (void)playHangman:(NSArray*)hangmanWordsArray {
    int chosenWordIndex = arc4random_uniform(10000);
    NSString* chosenWord = hangmanWordsArray[chosenWordIndex]; //Player guesses this word
    NSMutableArray* letterIndeces = [self showNeededElements:chosenWord.length];
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
