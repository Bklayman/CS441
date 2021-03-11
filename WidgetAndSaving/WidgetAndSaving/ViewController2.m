//
//  ViewController2.m
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/10/21.
//

#import "ViewController2.h"
#import "Singleton.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (UILabel*)getLabelByIndex:(int)index{
    switch(index){
        case 0:
            return _Th;
        case 1:
            return _is;
        case 2:
            return _is2;
        case 3:
            return _yo;
        case 4:
            return _ur;
        case 5:
            return _fi;
        case 6:
            return _na;
        case 7:
            return _l_r;
        case 8:
            return _es;
        case 9:
            return _ul;
        case 10:
            return _tEnd;
    }
    return NULL;
}

- (void)viewDidLoad{
    int colorNum = 0;
    NSMutableArray* recievedColors = [[NSMutableArray alloc] init];
    for(int i = 0; i < [[Singleton sharedObject].colors count]; i++){
        if(![recievedColors containsObject:[Singleton sharedObject].colors[i]]){
            colorNum++;
            [recievedColors addObject:[Singleton sharedObject].colors[i]];
        }
    }
    if(colorNum == 0){
        return;
    }
    for(int i = 0; i < 11; i++){
        int colorChoiceIndex = i % colorNum;
        [self getLabelByIndex:i].textColor = recievedColors[colorChoiceIndex];
    }
}

@end
