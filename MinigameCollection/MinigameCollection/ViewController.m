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

NSMutableArray* hangmanLetterIndices;
int misses;
NSString* wordToGuess;

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
    NSMutableArray* usedLabels = [NSMutableArray array];
    if(wordLength < 8){ //Word length: 1-7
        for(int i = 7; i > 0; i--){
            [self getUIImage:i].hidden = FALSE;
            [self getUILabel:i].text = @"";
        }
        unsigned long blankSpaces = 7 - wordLength;
        int extraSpace = blankSpaces % 2;
        for(int i = 0; i < 8; i++){
            if(i < blankSpaces / 2 + extraSpace || i > 7 - blankSpaces / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
            }
        }
        for(int i = 8; i < 23; i++){
            [self getUIImage:i].hidden = TRUE;
            [self getUILabel:i].text = @"";
        }
    } else if(wordLength < 15){ //Word length: 8-14
        unsigned long blankSpaces = 14 - wordLength;
        int extraSpace = blankSpaces % 2;
        unsigned long line1Blanks = blankSpaces / 2;
        int line1ExtraSpace = line1Blanks % 2;
        unsigned long line2Blanks = blankSpaces / 2 + extraSpace;
        int line2ExtraSpace = line2Blanks % 2;
        for(int i = 0; i < 8; i++){
            if(i < line1Blanks / 2 + line1ExtraSpace || i > 7 - line1Blanks / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
            }
            [self getUILabel:i].text = @"";
        }
        for(int i = 8; i < 15; i++){
            if(i < 8 + line2Blanks / 2 + line2ExtraSpace || i > 14 - line2Blanks / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
            }
            [self getUILabel:i].text = @"";
        }
        for(int i = 15; i < 23; i++){
            [self getUIImage:i].hidden = TRUE;
            [self getUILabel:i].text = @"";
        }
    } else { //Word length: 15-22
        unsigned long blankSpaces = 22 - wordLength;
        int extraSpaces = blankSpaces % 3;
        unsigned long line1Blanks = blankSpaces / 3;
        if(extraSpaces > 0){
            line1Blanks++;
        }
        int line1ExtraSpace = line1Blanks % 2;
        unsigned long line2Blanks = blankSpaces / 3;
        if(extraSpaces == 2){
            line2Blanks++;
        }
        int line2ExtraSpace = line2Blanks % 2;
        unsigned long line3Blanks = blankSpaces / 3;
        int line3ExtraSpace = line3Blanks % 2;
        for(int i = 0; i < 23; i++){
            if(i < 8){
                if(i < line1Blanks / 2 + line1ExtraSpace || i > 7 - line1Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                }
            } else if(i < 15){
                if(i < 7 + line2Blanks / 2 + line2ExtraSpace || i > 14 - line2Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                }
            } else {
                if(i < 14 + line3Blanks / 2 + line3ExtraSpace || i > 22 - line3Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                }
            }
            [self getUILabel:i].text = @"";
        }
    }
    return usedLabels;
}

- (void)playHangman:(NSArray*)hangmanWordsArray {
    misses = 0;
    int chosenWordIndex = arc4random_uniform(10000);
    wordToGuess = hangmanWordsArray[chosenWordIndex]; //Player guesses this word
    hangmanLetterIndices = [self showNeededElements:wordToGuess.length];
}

- (IBAction)hangmanGuessButtonClicked:(id)sender{
    NSString* guess = _Guess.text;
    if(guess.length != 1){
        return;
    }
    _Guess.text = @"";
    guess = [guess lowercaseString];
    char charGuessed = [guess characterAtIndex:0];
    if(charGuessed < 'a' || charGuessed > 'z'){
        return;
    }
    bool correctGuess = FALSE;
    for(int i = 0; i < wordToGuess.length; i++){
        //TODO
    }
    if(!correctGuess){
        //TODO
    }
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
