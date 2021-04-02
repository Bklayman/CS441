//
//  WordChecker.m
//  GameProject
//
//  Created by Brendan Klayman on 3/29/21.
//

#import "WordChecker.h"
#import "Singleton.h"

@interface WordChecker ()

@end

@implementation WordChecker

- (void)viewDidLoad{
    [super viewDidLoad];
    [_player1Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player2Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player3Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player4Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player5Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_player6Word addTarget:self action:@selector(nameTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self enableCheckBoxes];
    [self addGivenWords];
    [self showNeededAssets];
}

- (void)showNeededAssets{
    if([Singleton sharedObject].playerExists[0]){
        _player3Name.hidden = FALSE;
        _player3Word.hidden = FALSE;
        _check3.hidden = FALSE;
        _checkBox3.hidden = FALSE;
    } else {
        _player3Name.hidden = TRUE;
        _player3Word.hidden = TRUE;
        _check3.hidden = TRUE;
        _checkBox3.hidden = TRUE;
    }
    if([Singleton sharedObject].playerExists[1]){
        _player4Name.hidden = FALSE;
        _player4Word.hidden = FALSE;
        _check4.hidden = FALSE;
        _checkBox4.hidden = FALSE;
    } else {
        _player4Name.hidden = TRUE;
        _player4Word.hidden = TRUE;
        _check4.hidden = TRUE;
        _checkBox4.hidden = TRUE;
    }
    if([Singleton sharedObject].playerExists[2]){
        _player5Name.hidden = FALSE;
        _player5Word.hidden = FALSE;
        _check5.hidden = FALSE;
        _checkBox5.hidden = FALSE;
    } else {
        _player5Name.hidden = TRUE;
        _player5Word.hidden = TRUE;
        _check5.hidden = TRUE;
        _checkBox5.hidden = TRUE;
    }
    if([Singleton sharedObject].playerExists[3]){
        _player6Name.hidden = FALSE;
        _player6Word.hidden = FALSE;
        _check6.hidden = FALSE;
        _checkBox6.hidden = FALSE;
    } else {
        _player6Name.hidden = TRUE;
        _player6Word.hidden = TRUE;
        _check6.hidden = TRUE;
        _checkBox6.hidden = TRUE;
    }
}

- (void)addGivenWords{
    _player1Word.text = [Singleton sharedObject].playerWords[0];
    _player2Word.text = [Singleton sharedObject].playerWords[1];
    _player3Word.text = [Singleton sharedObject].playerWords[2];
    _player4Word.text = [Singleton sharedObject].playerWords[3];
    _player5Word.text = [Singleton sharedObject].playerWords[4];
    _player6Word.text = [Singleton sharedObject].playerWords[5];
}

//Based on https://stackoverflow.com/questions/17120476/click-event-on-uiimageview-programmatically-in-ios
- (void)enableCheckBoxes{
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected1)];
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected2)];
    UITapGestureRecognizer* singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected3)];
    UITapGestureRecognizer* singleTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected4)];
    UITapGestureRecognizer* singleTap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected5)];
    UITapGestureRecognizer* singleTap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected6)];
    singleTap1.numberOfTapsRequired = 1;
    singleTap2.numberOfTapsRequired = 1;
    singleTap3.numberOfTapsRequired = 1;
    singleTap4.numberOfTapsRequired = 1;
    singleTap5.numberOfTapsRequired = 1;
    singleTap6.numberOfTapsRequired = 1;
    [_checkBox1 setUserInteractionEnabled:YES];
    [_checkBox2 setUserInteractionEnabled:YES];
    [_checkBox3 setUserInteractionEnabled:YES];
    [_checkBox4 setUserInteractionEnabled:YES];
    [_checkBox5 setUserInteractionEnabled:YES];
    [_checkBox6 setUserInteractionEnabled:YES];
    [_checkBox1 addGestureRecognizer:singleTap1];
    [_checkBox2 addGestureRecognizer:singleTap1];
    [_checkBox3 addGestureRecognizer:singleTap1];
    [_checkBox4 addGestureRecognizer:singleTap1];
    [_checkBox5 addGestureRecognizer:singleTap1];
    [_checkBox6 addGestureRecognizer:singleTap1];
}

- (void)tapDetected1{
    _check1.hidden = !_check1.hidden;
    if(_check1.hidden){
        [Singleton sharedObject].playerWords[0] = @"";
    } else {
        [Singleton sharedObject].playerWords[0] = _player1Word.text;
    }
}

- (void)tapDetected2{
    _check2.hidden = !_check2.hidden;
    if(_check2.hidden){
        [Singleton sharedObject].playerWords[1] = @"";
    } else {
        [Singleton sharedObject].playerWords[1] = _player2Word.text;
    }
}

- (void)tapDetected3{
    _check3.hidden = !_check3.hidden;
    if(_check3.hidden){
        [Singleton sharedObject].playerWords[2] = @"";
    } else {
        [Singleton sharedObject].playerWords[2] = _player3Word.text;
    }
}

- (void)tapDetected4{
    _check4.hidden = !_check4.hidden;
    if(_check4.hidden){
        [Singleton sharedObject].playerWords[3] = @"";
    } else {
        [Singleton sharedObject].playerWords[3] = _player4Word.text;
    }
}

- (void)tapDetected5{
    _check5.hidden = !_check5.hidden;
    if(_check5.hidden){
        [Singleton sharedObject].playerWords[4] = @"";
    } else {
        [Singleton sharedObject].playerWords[4] = _player5Word.text;
    }
}

- (void)tapDetected6{
    _check6.hidden = !_check6.hidden;
    if(_check6.hidden){
        [Singleton sharedObject].playerWords[5] = @"";
    } else {
        [Singleton sharedObject].playerWords[5] = _player6Word.text;
    }
}

- (IBAction)nameTextDone:(id)sender{
    [sender resignFirstResponder];
    if(!_check1.hidden){
        [Singleton sharedObject].playerWords[0] = _player1Word.text;
    }
    if(!_check2.hidden){
        [Singleton sharedObject].playerWords[1] = _player2Word.text;
    }
    if(!_check3.hidden){
        [Singleton sharedObject].playerWords[2] = _player3Word.text;
    }
    if(!_check4.hidden){
        [Singleton sharedObject].playerWords[3] = _player4Word.text;
    }
    if(!_check5.hidden){
        [Singleton sharedObject].playerWords[4] = _player5Word.text;
    }
    if(!_check6.hidden){
        [Singleton sharedObject].playerWords[5] = _player6Word.text;
    }
}

@end
