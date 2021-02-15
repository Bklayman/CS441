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

- (IBAction) spanishButtonClicked:(id)sender
{
    [myLabel setText:@"Hola Mundo"]; //myLabel.setText() is the Java version
}

- (IBAction) englishButtonClicked:(id)sender
{
    [myLabel setText:@"Hello World"];
}

- (IBAction) frenchButtonClicked:(id)sender
{
    [myLabel setText:@"Bonjour le Monde"];
}

- (IBAction) italianButtonClicked:(id)sender
{
    [myLabel setText:@"Ciao Mondo"];
}

- (IBAction) dutchButtonClicked:(id)sender
{
    [myLabel setText:@"Hallo Wereld"];
}

- (IBAction) finnishButtonClicked:(id)sender
{
    [myLabel setText:@"Hei Maailma"];
}

- (IBAction) latinButtonClicked:(id)sender
{
    [myLabel setText:@"Salve Orbis Terrarum"];
}

- (IBAction) irishButtonClicked:(id)sender
{
    [myLabel setText:@"Dia Duit an Domhan"];
}

- (IBAction) welshButtonClicked:(id)sender
{
    [myLabel setText:@"Helo Byd"];
}

@end
