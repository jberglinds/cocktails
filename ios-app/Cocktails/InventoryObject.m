//
//  InventoryObject.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "InventoryObject.h"

@interface InventoryObject ()
@property (nonatomic, readwrite) NSInteger id;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *type;
@end

@implementation InventoryObject

- (instancetype)initWithId:(NSInteger)id name:(NSString *)name andType:(NSString *)type {
    self = [super init];

    if (self) {
        self.id = id;
        self.name = name;
        self.type = type;
    }

    return self;
}

@end
