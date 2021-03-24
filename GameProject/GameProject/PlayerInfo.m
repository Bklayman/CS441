//
//  ViewController.m
//  GameProject
//
//  Created by Brendan Klayman on 3/22/21.
//

#import "PlayerInfo.h"
#import "Singleton.h"

@interface PlayerInfo ()

@end

@implementation PlayerInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self enableCheckBoxes];
    [_player1Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player2Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player3Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player4Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player5Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player6Name addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
}


//Based on https://stackoverflow.com/questions/17120476/click-event-on-uiimageview-programmatically-in-ios
- (void)enableCheckBoxes{
    UITapGestureRecognizer* singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected3)];
    UITapGestureRecognizer* singleTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected4)];
    UITapGestureRecognizer* singleTap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected5)];
    UITapGestureRecognizer* singleTap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected6)];
    singleTap3.numberOfTapsRequired = 1;
    singleTap4.numberOfTapsRequired = 1;
    singleTap5.numberOfTapsRequired = 1;
    singleTap6.numberOfTapsRequired = 1;
    [_checkBox3 setUserInteractionEnabled:YES];
    [_checkBox3 addGestureRecognizer:singleTap3];
    [_checkBox4 setUserInteractionEnabled:YES];
    [_checkBox4 addGestureRecognizer:singleTap4];
    [_checkBox5 setUserInteractionEnabled:YES];
    [_checkBox5 addGestureRecognizer:singleTap5];
    [_checkBox6 setUserInteractionEnabled:YES];
    [_checkBox6 addGestureRecognizer:singleTap6];
}

- (void)tapDetected3{
    [Singleton sharedObject].player3Exists = ![Singleton sharedObject].player3Exists;
    _check3.hidden = !_check3.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected4{
    [Singleton sharedObject].player4Exists = ![Singleton sharedObject].player4Exists;
    _check4.hidden = !_check4.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected5{
    [Singleton sharedObject].player5Exists = ![Singleton sharedObject].player5Exists;
    _check5.hidden = !_check5.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected6{
    [Singleton sharedObject].player6Exists = ![Singleton sharedObject].player6Exists;
    _check6.hidden = !_check6.hidden;
    [self checkEnteredNames];
}

- (void)checkEnteredNames{
    if([[Singleton sharedObject].player1Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([[Singleton sharedObject].player2Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].player3Exists && [[Singleton sharedObject].player3Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].player4Exists && [[Singleton sharedObject].player4Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].player5Exists && [[Singleton sharedObject].player5Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].player6Exists && [[Singleton sharedObject].player6Name isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    _startGameButton.hidden = FALSE;
}

- (IBAction)nameTextDone:(id)sender{
    [sender resignFirstResponder];
    [Singleton sharedObject].player1Name = _player1Name.text;
    [Singleton sharedObject].player2Name = _player2Name.text;
    [Singleton sharedObject].player3Name = _player3Name.text;
    [Singleton sharedObject].player4Name = _player4Name.text;
    [Singleton sharedObject].player5Name = _player5Name.text;
    [Singleton sharedObject].player6Name = _player6Name.text;
    [self checkEnteredNames];
}

@end
