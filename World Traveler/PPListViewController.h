//
//  ViewController.h
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)refreshAction:(UIBarButtonItem *)sender;
- (IBAction)menuAction:(UIBarButtonItem *)sender;

@end

