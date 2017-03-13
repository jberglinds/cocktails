//
//  EventInfo.h
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-13.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventInfo : NSObject

// Designated initializer
- (instancetype) initWithId:(NSInteger)id name:(NSString *)eventname andDate:(NSDate *)startDate;

@property (nonatomic, readonly) NSInteger id;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSDate *startDate;

@end
