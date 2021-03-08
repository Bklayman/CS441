//
//  ViewController.h
//  WidgetAndSaving
//
//  Created by Brendan Klayman on 3/8/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, strong) IBOutlet UITableView* tableView;

@property (nonatomic, strong) NSMutableArray* items;

@property (nonatomic, strong) IBOutlet UITextField* inputText;

@end

