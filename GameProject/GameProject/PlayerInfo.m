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
    _check3.hidden = TRUE;
    _check4.hidden = TRUE;
    _check5.hidden = TRUE;
    _check6.hidden = TRUE;
}

- (void)tapDetected3{
    [Singleton sharedObject].playerExists[0] = [NSNumber numberWithBool:(BOOL)[Singleton sharedObject].playerExists[0]];
    _check3.hidden = !_check3.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected4{
    [Singleton sharedObject].playerExists[1] = [NSNumber numberWithBool:(BOOL)[Singleton sharedObject].playerExists[1]];
    _check4.hidden = !_check4.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected5{
    [Singleton sharedObject].playerExists[2] = [NSNumber numberWithBool:(BOOL)[Singleton sharedObject].playerExists[2]];
    _check5.hidden = !_check5.hidden;
    [self checkEnteredNames];
}

- (void)tapDetected6{
    [Singleton sharedObject].playerExists[3] = [NSNumber numberWithBool:(BOOL)[Singleton sharedObject].playerExists[3]];
    _check6.hidden = !_check6.hidden;
    [self checkEnteredNames];
}

- (void)checkEnteredNames{
    if([[Singleton sharedObject].playerNames[0] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([[Singleton sharedObject].playerNames[1] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].playerExists[0] == [NSNumber numberWithBool:TRUE] && [[Singleton sharedObject].playerNames[2] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].playerExists[1] == [NSNumber numberWithBool:TRUE] && [[Singleton sharedObject].playerNames[3] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].playerExists[2] == [NSNumber numberWithBool:TRUE] && [[Singleton sharedObject].playerNames[4] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    if([Singleton sharedObject].playerExists[3] == [NSNumber numberWithBool:TRUE] && [[Singleton sharedObject].playerNames[5] isEqualToString:@""]){
        _startGameButton.hidden = TRUE;
        return;
    }
    _startGameButton.hidden = FALSE;
}

- (void)setPlayerName:(NSString*)name :(int)index{
    switch(index){
        case 0:
            [Singleton sharedObject].playerNames[0] = name;
        case 1:
            [Singleton sharedObject].playerNames[1] = name;
        case 2:
            [Singleton sharedObject].playerNames[2] = name;
        case 3:
            [Singleton sharedObject].playerNames[3] = name;
        case 4:
            [Singleton sharedObject].playerNames[4] = name;
        case 5:
            [Singleton sharedObject].playerNames[5] = name;
    }
}

- (IBAction)nameTextDone:(id)sender{
    [sender resignFirstResponder];
    [self setPlayerName:_player1Name.text :0];
    [self setPlayerName:_player2Name.text :1];
    [self setPlayerName:_player3Name.text :2];
    [self setPlayerName:_player4Name.text :3];
    [self setPlayerName:_player5Name.text :4];
    [self setPlayerName:_player6Name.text :5];
    [self checkEnteredNames];
}

- (void)checkUsedNames{
    //TODO
}

@end
