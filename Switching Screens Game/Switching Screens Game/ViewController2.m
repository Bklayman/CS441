//
//  ViewController2.m
//  Switching Screens Game
//
//  Created by Brendan Klayman on 2/22/21.
//

#import "ViewController2.h"
#import "Singleton.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (UIImageView*)getNumImage:(int)index{
    switch(index){
        case 0:
            return _num1;
        case 1:
            return _num2;
        case 2:
            return _num3;
        case 3:
            return _num4;
        case 4:
            return _num5;
        case 5:
            return _num6;
        case 6:
            return _num7;
        case 7:
            return _num8;
        case 8:
            return _num9;
        case 9:
            return _num10;
        default:
            return NULL;
    }
}

- (NSString*)getImageLink:(int)index{
    switch(index){
        case 0:
            return @"0.png";
        case 1:
            return @"1.jpeg";
        case 2:
            return @"2.png";
        case 3:
            return @"3.jpeg";
        case 4:
            return @"4.png";
        case 5:
            return @"5.jpeg";
        case 6:
            return @"6.png";
        case 7:
            return @"7.png";
        case 8:
            return @"8.png";
        case 9:
            return @"9.png";
        default:
            return NULL;
    }
}

- (void)changeNums{
    NSString* newConfig = [Singleton sharedObject].commonString;
    printf([[Singleton sharedObject].commonString UTF8String]);
    for(int i = 0; i < newConfig.length; i++){
        [self getNumImage:i].hidden = FALSE;
        [self getNumImage:i].image = [UIImage imageNamed:[self getImageLink:([newConfig characterAtIndex:i] - '0')]];
    }
    for(int i = (int)newConfig.length; i < 10; i++){
        [self getNumImage:i].hidden = TRUE;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self changeNums];
}


@end
