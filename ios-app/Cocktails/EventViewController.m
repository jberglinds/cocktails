//
//  EventViewController.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "EventViewController.h"
#import "SpiritInventoryTableViewController.h"
#import "MixerInventoryTableViewController.h"

@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.eventNameLabel.text = self.event.name;
    self.eventDateLabel.text = [NSDateFormatter localizedStringFromDate:self.event.startDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSpiritInventory"]) {
        SpiritInventoryTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.event = self.event;
    }
    if ([segue.identifier isEqualToString:@"showMixerInventory"]) {
        MixerInventoryTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.event = self.event;
    }
}

@end
