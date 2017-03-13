//
//  EventInfo.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-13.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "EventInfo.h"

@interface EventInfo ()
@property (nonatomic, readwrite) NSInteger id;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSDate *startDate;
@end

@implementation EventInfo

- (instancetype) initWithId:(NSInteger)id name:(NSString *)eventname andDate:(NSDate *)startDate {
    self = [super init];

    if (self) {
        self.id = id;
        self.name = eventname;
        self.startDate = startDate;
    }

    return self;
}

@end
