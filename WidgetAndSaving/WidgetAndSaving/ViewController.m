//
//  ViewController.m
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/8/21.
//

#import "ViewController.h"
#import "Singleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_inputText addTarget:self action:@selector(itemTextDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _colors = [[NSMutableArray alloc] init];
    [_tableView reloadData];
}

- (nonnull UITableViewCell*)tableView:(nonnull UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    [[cell textLabel] setText:[_colors objectAtIndex:[indexPath row]]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [_colors count];
}

- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"%d", [_colors count]);
    [_colors removeObjectAtIndex:[indexPath row]];
    NSLog(@"%d", [_colors count]);
    [tableView reloadData];
}

- (IBAction)addItem:(id)sender{
    if([_inputText text].length == 0){
        return;
    }
    NSString* str = [_inputText text];
    [_colors addObject:str];
    [_inputText setText:@""];
    [_tableView reloadData];
}

- (IBAction)EditItems:(id)sender{
    [_tableView setEditing:![_tableView isEditing]];
}

- (IBAction)itemTextDone:(id)sender{
    [sender resignFirstResponder];
}

- (IBAction)checkColorsClicked:(id)sender{
    NSLog(@"%d", [_colors count]);
    for(int i = 0; i < [_colors count]; i++){
        UIColor* returnedColor = [self getUIColorFromString:_colors[i]];
        if(returnedColor == NULL || [[Singleton sharedObject].colors containsObject:returnedColor]){
            continue;
        }
        [[Singleton sharedObject].colors addObject:returnedColor];
    }
}

- (UIColor*)getUIColorFromString:(NSString*)word{
    word = [word lowercaseString];
    word = [word stringByReplacingOccurrencesOfString:@" " withString:@""];
    if([word isEqualToString:@"red"]){
        return UIColor.redColor;
    } else if([word isEqualToString:@"blue"]){
        return UIColor.blueColor;
    } else if([word isEqualToString:@"green"]){
        return UIColor.greenColor;
    } else if([word isEqualToString:@"yellow"]){
        return UIColor.yellowColor;
    } else if([word isEqualToString:@"orange"]){
        return UIColor.orangeColor;
    } else if([word isEqualToString:@"purple"]){
        return UIColor.purpleColor;
    } else if([word isEqualToString:@"black"]){
        return UIColor.blackColor;
    } else if([word isEqualToString:@"white"]){
        return UIColor.whiteColor;
    } else if([word isEqualToString:@"brown"]){
        return UIColor.brownColor;
    } else if([word isEqualToString:@"pink"]){
        return UIColor.systemPinkColor;
    } else if([word isEqualToString:@"gray"] || [word isEqualToString:@"grey"]){
        return UIColor.grayColor;
    }
    return NULL;
}


@end
