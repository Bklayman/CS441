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

- (IBAction) blackButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor blackColor];
}

- (IBAction) blueButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor blueColor];
}

- (IBAction) redButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor redColor];
}

- (IBAction) greenButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor greenColor];
}

- (IBAction) pinkButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor systemPinkColor];
}

- (IBAction) brownButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor brownColor];
}

- (IBAction) purpleButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor purpleColor];
}

- (IBAction) yellowButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor yellowColor];
}

- (IBAction) orangeButtonClicked:(id)sender
{
    myLabel.textColor = [UIColor orangeColor];
}

- (IBAction) surpriseButtonClicked:(id)sender
{
    [myLabel setText:@"Bleep Blorp"];
    _personImage.image = [UIImage imageNamed:@"Alien.png"];
    _planetImage.image = [UIImage imageNamed:@"Mars.jpeg"];
    myLabel.textColor = [UIColor greenColor];
}

@end
