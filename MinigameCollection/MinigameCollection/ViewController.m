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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* hangmanWordListPath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
    NSMutableArray *hangmanWordsArray = [NSMutableArray array];
    for(int i = 0; i < 10000; i++){
        //TODO Add words to hangmanWordsArray
    }
}


@end
