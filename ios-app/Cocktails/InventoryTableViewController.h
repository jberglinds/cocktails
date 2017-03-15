//
//  InventoryTableViewController.h
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventInfo.h"

@interface InventoryTableViewController : UITableViewController

@property (strong, nonatomic) EventInfo *event;

@end
