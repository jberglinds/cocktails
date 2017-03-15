//
//  MixerInventoryTableViewController.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "MixerInventoryTableViewController.h"
#import "CocktailsAPI.h"
#import "InventoryObject.h"

@interface MixerInventoryTableViewController ()
@property (strong, nonatomic) NSMutableDictionary *availableMixers;
@property (strong, nonatomic) NSMutableDictionary *mixersInInventory;
@property (strong, nonatomic) CocktailsAPI *API;
@end

@implementation MixerInventoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.API getMixers:^(NSArray *response) {
        for (NSDictionary *entry in response) {
            InventoryObject *mixer = [[InventoryObject alloc] initWithId:[entry[@"id"] integerValue] name:entry[@"name"] andType:entry[@"type"]];
            [self.availableMixers setValue:mixer forKey:mixer.name];
        }
        [self.API getMixersInInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSArray *response) {
            for (NSDictionary *entry in response) {
                InventoryObject *mixer = self.availableMixers[entry[@"name"]];
                [self.mixersInInventory setValue:mixer forKey:mixer.name];
            }
            [self.tableView reloadData];
        }];
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSMutableDictionary *)availableMixers {
    if (!_availableMixers) _availableMixers = [[NSMutableDictionary alloc] init];
    return _availableMixers;
}

- (NSMutableDictionary *)mixersInInventory {
    if (!_mixersInInventory) _mixersInInventory = [[NSMutableDictionary alloc] init];
    return _mixersInInventory;
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
    return [self.availableMixers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mixer" forIndexPath:indexPath];
    
    InventoryObject *mixer = [self.availableMixers allValues][indexPath.row];
    
    if ([self.mixersInInventory valueForKey:mixer.name]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = mixer.name;
    cell.detailTextLabel.text = mixer.type;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InventoryObject *mixer = [self.availableMixers allValues][indexPath.row];
    if ([self.mixersInInventory objectForKey:mixer.name]) {
        [self.API removeMixerWithId:mixer.id FromInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSURLSessionDataTask *task, NSArray *response) {
            if (((NSHTTPURLResponse *)task.response).statusCode == 204) {
                [self.mixersInInventory removeObjectForKey:mixer.name];
                [self.tableView reloadData];
            }
        }];
    } else {
        [self.API addMixerWithId:mixer.id ToInventoryForEventWithId:self.event.id withPassword:self.event.password :^(NSURLSessionDataTask *task, NSArray *response) {
            if (((NSHTTPURLResponse *)task.response).statusCode == 204) {
                [self.mixersInInventory setValue:mixer forKey:mixer.name];
                [self.tableView reloadData];
            }
        }];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
