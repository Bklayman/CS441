//
//  ViewController.m
//  Hello World
//
//  Created by Brendan Klayman on 2/15/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction) clickedTheButton:(id)sender
{
    [myLabel setText:@"The button was clicked"]; //myLabel.setText() is the Java version
    
}

@end
