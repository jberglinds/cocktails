//
//  InventoryTableViewController.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "InventoryTableViewController.h"
#import "InventoryObject.h"
#import "CocktailsAPI.h"

@interface InventoryTableViewController ()
@property (strong, nonatomic) NSMutableDictionary *availableSpirits;
@property (strong, nonatomic) NSMutableDictionary *spiritsInInventory;
@property (strong, nonatomic) CocktailsAPI *API;
@end

@implementation InventoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.API getSpirits:^(NSArray *response) {
        for (NSDictionary *entry in response) {
            InventoryObject *spirit = [[InventoryObject alloc] initWithId:[entry[@"id"] integerValue] name:entry[@"name"] andType:entry[@"type"]];
            [self.availableSpirits setValue:spirit forKey:spirit.name];
            [self.tableView reloadData];
        }
    }];

    [self.API getSpiritsInInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSArray *response) {
        for (NSDictionary *entry in response) {
            InventoryObject *spirit = self.availableSpirits[entry[@"name"]];
            [self.spiritsInInventory setValue:spirit forKey:spirit.name];
            [self.tableView reloadData];
        }
    }];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSMutableDictionary *)availableSpirits {
    if (!_availableSpirits) _availableSpirits = [[NSMutableDictionary alloc] init];
    return _availableSpirits;
}

- (NSMutableDictionary *)spiritsInInventory {
    if (!_spiritsInInventory) _spiritsInInventory = [[NSMutableDictionary alloc] init];
    return _spiritsInInventory;
}

- (CocktailsAPI *)API {
    if (!_API) _API = [[CocktailsAPI alloc] init];
    return _API;
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
    return [self.availableSpirits count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"spirit" forIndexPath:indexPath];

    InventoryObject *spirit = [self.availableSpirits allValues][indexPath.row];

    if ([self.spiritsInInventory valueForKey:spirit.name]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    cell.textLabel.text = spirit.name;
    cell.detailTextLabel.text = spirit.type;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InventoryObject *spirit = [self.availableSpirits allValues][indexPath.row];
    if ([self.spiritsInInventory objectForKey:spirit.name]) {
        [self.API removeSpiritWithId:spirit.id FromInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSURLSessionDataTask *task, NSArray *response) {
            if (((NSHTTPURLResponse *)task.response).statusCode == 204) {
                [self.spiritsInInventory removeObjectForKey:spirit.name];
                [self.tableView reloadData];
            }
        }];
    } else {
        [self.API addSpiritWithId:spirit.id ToInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSURLSessionDataTask *task,     NSArray *response) {
            if (((NSHTTPURLResponse *)task.response).statusCode == 204) {
                [self.spiritsInInventory setValue:spirit forKey:spirit.name];
                [self.tableView reloadData];
            }
        }];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
