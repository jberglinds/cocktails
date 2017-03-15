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
- (void)getMixers:(void(^)(NSArray *))completion;
- (void)getMixersInInventoryForEventWithId:(NSInteger)id withPassword:(NSString *)password :(void(^)(NSArray *))completion;

- (void)addSpiritWithId: (NSInteger)spiritId ToInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion;
- (void)removeSpiritWithId:(NSInteger)spiritId FromInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion;
- (void)addMixerWithId: (NSInteger)mixerId ToInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion;
- (void)removeMixerWithId: (NSInteger)mixerId FromInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion;

@end
