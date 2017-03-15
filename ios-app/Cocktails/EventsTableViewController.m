//
//  EventsTableViewController.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-13.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "EventsTableViewController.h"
#import "AFNetworking.h"
#import "EventInfo.h"
#import "InventoryTableViewController.h"

@interface EventsTableViewController ()
@property (strong, nonatomic) NSMutableArray *events; // of EventInfo
@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) EventInfo *eventForSegue;
@end

@implementation EventsTableViewController

NSString *const EVENTS_API_ENDPOINT = @"http://localhost:8080/api/events";

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:EVENTS_API_ENDPOINT parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        for (NSDictionary *event in responseObject) {
            EventInfo *eventInfo = [[EventInfo alloc] initWithId:[event[@"id"] integerValue] name:event[@"name"] andDate:[self.dateFormatter dateFromString:event[@"start_date"]]];
            [self.events addObject:eventInfo];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Fail: %@", error);
    }];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

# pragma mark - Initialization
- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'.000Z'"];
    }
    return _dateFormatter;
}

- (NSMutableArray *)events {
    if (!_events) _events = [[NSMutableArray alloc] init];
    return _events;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.events count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"event" forIndexPath:indexPath];

    EventInfo *event = self.events[indexPath.row];

    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:event.startDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EventInfo *event = self.events[indexPath.row];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:event.name
                                                                   message:@"Enter password to administrate event."
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* dissmissAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * action) {
                                                               [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
                                                           }];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Enter" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              NSString *password = alert.textFields.firstObject.text;

                                                              AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                                                              [manager GET:[EVENTS_API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/%ld?passphrase=%@", (long)event.id, password]] parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                                                                  NSLog(@"Success: %@", responseObject);
                                                                  event.password = password;
                                                                  self.eventForSegue = event;
                                                                  [self performSegueWithIdentifier:@"showInventory" sender:self];
                                                              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                                  NSLog(@"Fail: %@", error);
                                                                  self.eventForSegue = nil;
                                                              }];

                                                          }];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Event password";
    }];

    [alert addAction:dissmissAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"showInventory"]) {
//
//        return YES;
//    }
//
//    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
//}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showInventory"]) {
        InventoryTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.event = self.eventForSegue;
    }
}


@end
