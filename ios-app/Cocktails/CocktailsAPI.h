//
//  API.h
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CocktailsAPI : NSObject

- (void)getEvents:(void(^)(NSArray *))completion;
- (void)getEventWithId:(NSInteger)id :(void(^)(NSArray *))completion;

- (void)getSpirits:(void(^)(NSArray *))completion;
- (void)getSpiritsInInventoryForEventWithId:(NSInteger)id withPassword:(NSString *)password :(void(^)(NSArray *))completion;

@end
