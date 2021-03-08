//
//  ViewController.m
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/8/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _items = [[NSMutableArray alloc] init];
    [_items addObject:@"Apples"];
    [_items addObject:@"Bananas"];
    [_items addObject:@"C Code"];
    
    [_tableView reloadData];
}

- (nonnull UITableViewCell*)tableView:(nonnull UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    [[cell textLabel] setText:[_items objectAtIndex:[indexPath row]]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}

- (IBAction)addItem:(id)sender{
    NSString* str = [_inputText text];
    [_items addObject:str];
    [_inputText setText:@""];
    [_tableView reloadData];
}


@end
