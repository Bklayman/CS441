//
//  rockPaperScissors.m
//  MinigameCollection
//
//  Created by Brendan Klayman on 3/19/21.
//

#import <Foundation/Foundation.h>
#import "rockPaperScissors.h"

@interface rockPaperScissors ()

@end

@implementation rockPaperScissors

- (void)viewDidLoad{
    [super viewDidLoad];
    _playerHand.hidden = TRUE;
    _opponentHand.hidden = TRUE;
    _points = 0;
    [self setAI];
}

- (void)setAI{
    _AIIndex = arc4random_uniform(4);
    switch(_AIIndex){
        case 0:
            [self setRandomName];
            break;
        case 1:
            [self setRockName];
            break;
        case 2:
            [self setPaperName];
            break;
        case 3:
            [self setScissorsName];
            break;
    }
}

- (void)setRandomName{
    NSArray* names = [NSArray arrayWithObjects:@"Harley", @"Fool", @"Motley", @"Marx", @"Dimentio", @"Cicero", nil];
    _opponentName.text = [NSString stringWithFormat:@"%@%s",names[arc4random_uniform((int)[names count])] ,":"];
}

- (void)setRockName{
    NSArray* names = [NSArray arrayWithObjects:@"Brock", @"Sisyphus", @"Roxanne", @"Dwayne", @"Geodude", @"Ignatius", nil];
    _opponentName.text = [NSString stringWithFormat:@"%@%s",names[arc4random_uniform((int)[names count])] ,":"];
}

- (void)setPaperName{
    NSArray* names = [NSArray arrayWithObjects:@"Forrest", @"Woody", @"Cherry", @"Rowan", @"Sylvia", @"Grover", nil];
    _opponentName.text = [NSString stringWithFormat:@"%@%s",names[arc4random_uniform((int)[names count])] ,":"];
}

- (void)setScissorsName{
    NSArray* names = [NSArray arrayWithObjects:@"Vlad", @"Edward", @"Lefty", @"Scarlett", @"Scanlon", @"Cutter", nil];
    _opponentName.text = [NSString stringWithFormat:@"%@%s",names[arc4random_uniform((int)[names count])] ,":"];
}

- (IBAction)rockPressed:(id)sender{
    _playerHand.hidden = FALSE;
    _opponentHand.hidden = FALSE;
    _playerChoice = 0;
    _playerHand.image = [UIImage imageNamed:@"rock.png"];
    [self opponentChoose];
}

- (IBAction)paperPressed:(id)sender{
    _playerHand.hidden = FALSE;
    _opponentHand.hidden = FALSE;
    _playerChoice = 1;
    _playerHand.image = [UIImage imageNamed:@"paper.png"];
    [self opponentChoose];
}

- (IBAction)scissorsPressed:(id)sender{
    _playerHand.hidden = FALSE;
    _opponentHand.hidden = FALSE;
    _playerChoice = 2;
    _playerHand.image = [UIImage imageNamed:@"scissors.png"];
    [self opponentChoose];
}

- (void)opponentRock{
    _opponentChoice = 0;
    _opponentHand.image = [UIImage imageNamed:@"rock.png"];
}

- (void)opponentPaper{
    _opponentChoice = 1;
    _opponentHand.image = [UIImage imageNamed:@"paper.png"];
}

- (void)opponentScissors{
    _opponentChoice = 2;
    _opponentHand.image = [UIImage imageNamed:@"scissors.png"];
}

- (void)opponentChoose{
    switch(_AIIndex){
        case 0:
            [self randomAIChoose];
            break;
        case 1:
            [self rockAIChoose];
            break;
        case 2:
            [self paperAIChoose];
            break;
        case 3:
            [self scissorsAIChoose];
            break;
        default:
            NSLog(@"Error: Invalid AI Index");
            exit(1);
    }
    [self checkResult];
}

- (void)randomAIChoose{
    int choice = arc4random_uniform(3);
    switch(choice){
        case 0:
            [self opponentRock];
            break;
        case 1:
            [self opponentPaper];
            break;
        case 2:
            [self opponentScissors];
            break;
    }
}

- (void)rockAIChoose{
    int choice = arc4random_uniform(6);
    if(choice < 4){
        [self opponentRock];
    } else if (choice == 4){
        [self opponentPaper];
    } else {
        [self opponentScissors];
    }
}

- (void)paperAIChoose{
    int choice = arc4random_uniform(6);
    if(choice < 4){
        [self opponentPaper];
    } else if (choice == 4){
        [self opponentRock];
    } else {
        [self opponentScissors];
    }
}

- (void)scissorsAIChoose{
    int choice = arc4random_uniform(6);
    if(choice < 4){
        [self opponentScissors];
    } else if (choice == 4){
        [self opponentPaper];
    } else {
        [self opponentRock];
    }
}

- (void)checkResult{
    if((_playerChoice == 0 && _opponentChoice == 1) || (_playerChoice == 1 && _opponentChoice == 2) || (_playerChoice == 2 && _opponentChoice == 0)){
        _points--;
    } else if((_playerChoice == 1 && _opponentChoice == 0) || (_playerChoice == 2 && _opponentChoice == 1) || (_playerChoice == 0 && _opponentChoice == 2)){
        _points++;
    }
    _numPoints.text = [NSString stringWithFormat:@"%d", _points];
}

@end
