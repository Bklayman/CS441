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

- (NSMutableArray*)handValueHelper:(int)curValue :(NSMutableArray*)hand :(int)curIndex{
    NSMutableArray* result = [[NSMutableArray alloc] init];
    while(curIndex < [hand count]){
        //TODO
        curIndex++;
    }
    return result;
}

- (NSMutableArray*)getHandValue:(NSMutableArray*)hand{
    return [self handValueHelper:0 :hand :0];
}

@end
