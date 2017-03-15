//
//  InventoryObject.h
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InventoryObject : NSObject

// Designated initializer
- (instancetype) initWithId:(NSInteger)id name:(NSString *)name andType:(NSString *)type;

@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *type;

@end
