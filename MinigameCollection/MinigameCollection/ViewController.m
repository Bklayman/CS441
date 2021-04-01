//
//  ViewController.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 2/17/21.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray* hangmanLetterIndices;
int misses;
int hits;
NSString* wordToGuess;
//TODO expand labels to fit p and q

- (UIImageView*)getUIImage:(int)index{ //Returns the UIImage dash at the index provided
    index++;
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

- (UILabel*)getUILabel:(int)index{  //Returns the UILabel letter at the index provided
    index++;
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

- (NSMutableArray*)showNeededElements:(unsigned long)wordLength{ //Displays dashes at places needed for the chosen word, removes all text already in every UILabel, and returns UILabels at spaces needed for the chosen word
    NSMutableArray* usedLabels = [NSMutableArray array];
    if(wordLength < 8){ //Word length: 1-7
        for(int i = 6; i >= 0; i--){
            [self getUIImage:i].hidden = FALSE;
            [self getUILabel:i].text = @"";
        }
        unsigned long blankSpaces = 7 - wordLength;
        int extraSpace = blankSpaces % 2;
        for(int i = 0; i < 7; i++){
            if(i < blankSpaces / 2 + extraSpace || i > 6 - blankSpaces / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
            }
        }
        for(int i = 7; i < 22; i++){
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
        for(int i = 0; i < 7; i++){
            if(i < line1Blanks / 2 + line1ExtraSpace || i > 6 - line1Blanks / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
                [self getUIImage:i].hidden = FALSE;
            }
            [self getUILabel:i].text = @"";
        }
        for(int i = 7; i < 14; i++){
            if(i < 7 + line2Blanks / 2 + line2ExtraSpace || i > 13 - line2Blanks / 2){
                [self getUIImage:i].hidden = TRUE;
            } else {
                [usedLabels addObject:[self getUILabel:i]];
                [self getUIImage:i].hidden = FALSE;
            }
            [self getUILabel:i].text = @"";
        }
        for(int i = 14; i < 22; i++){
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
        for(int i = 0; i < 22; i++){
            if(i < 7){
                if(i < line1Blanks / 2 + line1ExtraSpace || i > 6 - line1Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                    [self getUIImage:i].hidden = FALSE;
                }
            } else if(i < 14){
                if(i < 7 + line2Blanks / 2 + line2ExtraSpace || i > 13 - line2Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                    [self getUIImage:i].hidden = FALSE;
                }
            } else {
                if(i < 14 + line3Blanks / 2 + line3ExtraSpace || i > 21 - line3Blanks / 2){
                    [self getUIImage:i].hidden = TRUE;
                } else {
                    [usedLabels addObject:[self getUILabel:i]];
                    [self getUIImage:i].hidden = FALSE;
                }
            }
            [self getUILabel:i].text = @"";
        }
    }
    return usedLabels;
}

- (void)playHangman:(NSArray*)hangmanWordsArray { //Initializes everything on the hangman board
    misses = 0;
    int chosenWordIndex = arc4random_uniform(10000);
    wordToGuess = hangmanWordsArray[chosenWordIndex]; //Player guesses this word
    [Singleton sharedObject].wordToGuess = wordToGuess;
    [Singleton sharedObject].gameOver = FALSE;
    [Singleton sharedObject].winGame = FALSE;
    misses = 0;
    hits = 0;
    [hangmanLetterIndices removeAllObjects];
    NSLog(@"%@", wordToGuess);
    hangmanLetterIndices = [self showNeededElements:wordToGuess.length];
    _bodyLeftArm.hidden = TRUE;
    _bodyLeftLeg.hidden = TRUE;
    _bodyRightArm.hidden = TRUE;
    _bodyRightLeg.hidden = TRUE;
    _bodyHead.hidden = TRUE;
    _bodyTorso.hidden = TRUE;
}

- (IBAction)hangmanGuessButtonClicked:(id)sender{ //Takes whatever is entered by the player, checks the input, and if the input is valid, checks the chosen word for the guessed letter (adding a miss if it is wrong)
    NSString* guess = _Guess.text;
    guess = [guess stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(guess.length != 1){
        return;
    }
    _Guess.text = @"";
    guess = [guess lowercaseString];
    char charGuessed = [guess characterAtIndex:0];
    if(charGuessed < 'a' || charGuessed > 'z'){
        return;
    }
    for(int i = 0; i < [_usedLetters count]; i++){
        if([_usedLetters[i] doubleValue] == charGuessed){
            [Singleton sharedObject].validAnswer = FALSE;
            [Singleton sharedObject].guess = charGuessed;
            return;
        }
    }
    NSMutableArray* letterPlaces = [[NSMutableArray alloc] init];
    for(int i = 0; i < wordToGuess.length; i++){
        if([wordToGuess characterAtIndex:i] == charGuessed){
            [letterPlaces addObject:[NSNumber numberWithInt:i]];
        }
    }
    if(letterPlaces.count == 0){
        [Singleton sharedObject].correctAnswer = FALSE;
        [Singleton sharedObject].validAnswer = TRUE;
        misses++;
        [self placeBody];
    } else {
        [Singleton sharedObject].validAnswer = TRUE;
        [Singleton sharedObject].correctAnswer = TRUE;
        [Singleton sharedObject].numFound = (int) letterPlaces.count;
        [Singleton sharedObject].guess = charGuessed;
        hits+= letterPlaces.count;
        [self placeLetters:letterPlaces];
        if(hits == wordToGuess.length){
            [self winGame];
        }
    }
    [self addUsedLetter:charGuessed];
}

- (void)addUsedLetter:(char)guess{
    [_usedLetters addObject:[NSNumber numberWithInteger:guess]];
    if(![_usedLettersLabel.text compare:@"N/A"]){
        _usedLettersLabel.text = [NSString stringWithFormat:@"%c", guess];
    } else {
        _usedLettersLabel.text = [NSString stringWithFormat:@"%@%@%c", _usedLettersLabel.text, @" ", guess];
    }
}

- (void)placeBody{
    switch(misses){
        case 1:
            _bodyHead.hidden = FALSE;
            break;
        case 2:
            _bodyTorso.hidden = FALSE;
            break;
        case 3:
            _bodyLeftArm.hidden = FALSE;
            break;
        case 4:
            _bodyRightArm.hidden = FALSE;
            break;
        case 5:
            _bodyLeftLeg.hidden = FALSE;
            break;
        case 6:
            _bodyRightLeg.hidden = FALSE;
            [self gameOver];
            break;
    }
}

- (void)gameOver{
    [Singleton sharedObject].gameOver = TRUE;
    _PlayAgainButton.hidden = FALSE;
}

- (void)winGame{
    [Singleton sharedObject].winGame = TRUE;
    _PlayAgainButton.hidden = FALSE;
}

- (void)placeLetters:(NSMutableArray*)letterPlaces{
    for(int i = 0; i < [letterPlaces count]; i++){
        int curLabelIndex = [letterPlaces[i] intValue];
        UILabel* curLabel = hangmanLetterIndices[curLabelIndex];
        curLabel.text = [NSString stringWithFormat:@"%c", [Singleton sharedObject].guess];
    }
}

- (NSArray*)getHangmanWordsArray{
    NSString* hangmanWordListPath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSString* loadedWord = [NSString stringWithContentsOfFile:hangmanWordListPath               encoding:NSUTF8StringEncoding
        error:NULL];
    NSArray* hangmanWordsArray = [loadedWord componentsSeparatedByString:@"\n"];
    return hangmanWordsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _usedLetters = [[NSMutableArray alloc] init];
    [_Guess addTarget:self action:@selector(guessTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    UIImage* leftPartsSource = [UIImage imageNamed:@"leftParts.png"];
    _bodyLeftArm.image = [UIImage imageWithCGImage:leftPartsSource.CGImage
                          scale:1 orientation:UIImageOrientationUpMirrored];
    _bodyLeftLeg.image = [UIImage imageWithCGImage:leftPartsSource.CGImage
                          scale:1 orientation:UIImageOrientationUpMirrored];
    
    NSArray* hangmanWordsArray = [self getHangmanWordsArray];
    [self playHangman:hangmanWordsArray];
}

- (IBAction)guessTextDone:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)playAgainClicked:(id)sender{
    [self playHangman:[self getHangmanWordsArray]];
    _PlayAgainButton.hidden = TRUE;
}

- (IBAction)instructionsClicked:(id)sender{
    [Singleton sharedObject].gameSource = 0;
}

@end
