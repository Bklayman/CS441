//
//  Blackjack.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 4/1/21.
//

#include "Blackjack.h"
#include "Singleton.h"

@interface Blackjack ()

@end

@interface Card:NSObject{
    NSString* suit;
    NSString* value;
}

@property (nonatomic, readwrite) NSString* suit;
@property (nonatomic, readwrite) NSString* value;

- (int)getValueInt:(NSString*)value;

@end

@implementation Card

@synthesize suit;
@synthesize value;

- (int)getValueInt:(NSString *)value{
    if([value isEqualToString:@"2"]){
        return 2;
    } else if([value isEqualToString:@"3"]){
        return 3;
    } else if([value isEqualToString:@"4"]){
        return 4;
    } else if([value isEqualToString:@"5"]){
        return 5;
    } else if([value isEqualToString:@"6"]){
        return 6;
    } else if([value isEqualToString:@"7"]){
        return 7;
    } else if([value isEqualToString:@"8"]){
        return 8;
    } else if([value isEqualToString:@"9"]){
        return 9;
    } else if([value isEqualToString:@"10"] || [value isEqualToString:@"Jack"] || [value isEqualToString:@"Queen"] || [value isEqualToString:@"King"]){
        return 10;
    } else if([value isEqualToString:@"Ace"]){
        return 1;
    }
    return -1;
}

- (id)init{
    self = [super init];
    suit = @"";
    value = @"";
    return self;
}

@end

@implementation Blackjack

- (void)viewDidLoad{
    [super viewDidLoad];
    NSMutableArray* deck = [self shuffleDeckRandom:[self createDeck]];
    
}

- (IBAction)instructionsClicked:(id)sender{
    [Singleton sharedObject].gameSource = 2;
}

- (NSString*)getCardImageLink:(Card*)card{
    NSString* suitAdd = @"";
    if([card.suit isEqualToString:@"Hearts"]){
        suitAdd = @"H.png";
    } else if([card.suit isEqualToString:@"Diamonds"]){
        suitAdd = @"D.png";
    } else if([card.suit isEqualToString:@"Spades"]){
        suitAdd = @"S.png";
    } else {
        suitAdd = @"C.png";
    }
    NSString* valueAdd = @"";
    if([card.value isEqualToString:@"2"] || [card.value isEqualToString:@"3"] || [card.value isEqualToString:@"4"] || [card.value isEqualToString:@"5"] || [card.value isEqualToString:@"6"] || [card.value isEqualToString:@"7"] || [card.value isEqualToString:@"8"] || [card.value isEqualToString:@"9"] || [card.value isEqualToString:@"10"]){
        valueAdd = card.value;
    } else if([card.value isEqualToString:@"Jack"]){
        valueAdd = @"J";
    } else if([card.value isEqualToString:@"Queen"]){
        valueAdd = @"Q";
    } else if([card.value isEqualToString:@"King"]){
        valueAdd = @"K";
    } else {
        valueAdd = @"A";
    }
    return [NSString stringWithFormat:@"%@%@", valueAdd, suitAdd];
}

- (NSString*)getSuit:(int)index{
    switch(index){
        case 0:
            return @"Hearts";
        case 1:
            return @"Diamonds";
        case 2:
            return @"Spades";
        case 3:
            return @"Clubs";
        default:
            return @"";
    }
}

- (NSString*)getValue:(int)index{
    switch(index){
        case 0:
            return @"2";
        case 1:
            return @"3";
        case 2:
            return @"4";
        case 3:
            return @"5";
        case 4:
            return @"6";
        case 5:
            return @"7";
        case 6:
            return @"8";
        case 7:
            return @"9";
        case 8:
            return @"10";
        case 9:
            return @"Jack";
        case 10:
            return @"Queen";
        case 11:
            return @"King";
        case 12:
            return @"Ace";
        default:
            return @"";
    }
}

- (NSMutableArray*)createDeck{
    NSMutableArray* deck = [[NSMutableArray alloc] init];
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 13; j++){
            Card* curCard = [[Card alloc] init];
            curCard.suit = [self getSuit:i];
            curCard.value = [self getValue:j];
            [deck addObject:curCard];
        }
    }
    return deck;
}

- (NSMutableArray*)shuffleDeckRandom:(NSMutableArray*)deck{
    for(int i = 0; i < 100; i++){
        int card1 = arc4random_uniform(52);
        int card2 = arc4random_uniform(52);
        while(card1 == card2){
            card2 = arc4random_uniform(52);
        }
        Card* takeCard2 = deck[card2];
        deck[card2] = deck[card1];
        deck[card1] = takeCard2;
    }
    return deck;
}

- (NSMutableArray*)handValueHelper:(int)curValue :(NSMutableArray*)hand :(int)curIndex{//Returns array of point totals
    NSMutableArray* result = [[NSMutableArray alloc] init];
    while(curIndex < [hand count]){
        Card* curCard = hand[curIndex];
        NSString* curValueName = curCard.value;
        if([curValueName isEqualToString:@"Ace"]){
            NSMutableArray* add1 = [self handValueHelper:(curValue + 1) :hand :(curIndex + 1)];
            NSMutableArray* add11 = [self handValueHelper:(curValue + 11) :hand :(curIndex + 1)];
            for(int i = 0; i < [add1 count]; i++){
                [result addObject:add1[i]];
            }
            for(int i = 0; i < [add11 count]; i++){
                [result addObject:add11[i]];
            }
            break;
        } else {
            curValue+= [hand[curValue] getValueInt:curValueName];
        }
        curIndex++;
    }
    for(int i = 0; i < [result count]; i++){
        if([result[i] intValue] > 21){
            [result removeObjectAtIndex:i];
            i--;
        }
    }
    return result;
}

- (NSMutableArray*)getHandValue:(NSMutableArray*)hand{
    return [self handValueHelper:0 :hand :0];
}

- (Card*)drawCard:(NSMutableArray**)deck{
    if([*deck count] == 0){
        *deck = [self shuffleDeckRandom:[self createDeck]];
    }
    Card* drawenCard = (*deck)[0];
    [*deck removeObjectAtIndex:0];
    return drawenCard;
}

- (UIImageView*)getImageView:(int)index{
    switch(index){
        case 0:
            return _playerCard1;
        case 1:
            return _playerCard2;
        case 2:
            return _playerCard3;
        case 3:
            return _playerCard4;
        case 4:
            return _playerCard5;
        case 5:
            return _playerCard6;
        case 6:
            return _playerCard7;
        case 7:
            return _playerCard8;
        case 8:
            return _opponentCard1;
        case 9:
            return _opponentCard2;
        case 10:
            return _opponentCard3;
        case 11:
            return _opponentCard4;
        case 12:
            return _opponentCard5;
        case 13:
            return _opponentCard6;
        case 14:
            return _opponentCard7;
        case 15:
            return _opponentCard8;
        default:
            return NULL;
    }
}

- (void)setCardImage:(int)imageIndex :(NSString*)link{
    [self getImageView:imageIndex].image = [UIImage imageNamed:link];
}

@end
