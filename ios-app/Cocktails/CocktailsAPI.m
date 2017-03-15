//
//  API.m
//  Cocktails
//
//  Created by Jonathan Berglind on 2017-03-15.
//  Copyright © 2017 Jonathan Berglind. All rights reserved.
//

#import "CocktailsAPI.h"
#import "AFNetworking.h"

@interface CocktailsAPI ()
@property (strong, nonatomic) AFHTTPSessionManager* manager;
@end

@implementation CocktailsAPI

NSString *const API_ENDPOINT = @"http://localhost:8080/api";

- (instancetype)init {
    self = [super init];

    if (self) {
        self.manager = [AFHTTPSessionManager manager];
    }

    return self;
}

- (void)getEvents:(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:@"/events"];
    [self getFromUrl:url :completion];
}

- (void)getEventWithId:(NSInteger)id :(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld", (long)id]];
    [self getFromUrl:url :completion];
}

- (void)getSpirits:(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:@"/spirits"];
    [self getFromUrl:url :completion];
}

- (void)getSpiritsInInventoryForEventWithId:(NSInteger)id withPassword:(NSString *)password :(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/spirits?passphrase=%@", (long)id, password]];
    [self getFromUrl:url :completion];
}

- (void)getMixers:(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:@"/mixers"];
    [self getFromUrl:url :completion];
}

- (void)getMixersInInventoryForEventWithId:(NSInteger)id withPassword:(NSString *)password :(void(^)(NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/mixers?passphrase=%@", (long)id, password]];
    [self getFromUrl:url :completion];
}

- (void)addSpiritWithId: (NSInteger)spiritId ToInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/add-spirit", (long)eventId]];
    NSDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:password forKey:@"passphrase"];
    [params setValue:@(spiritId) forKey:@"spiritId"];
    [self postToUrl:url withParams:params :completion];
}

- (void)removeSpiritWithId:(NSInteger)spiritId FromInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/remove-spirit", (long)eventId]];
    NSDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:password forKey:@"passphrase"];
    [params setValue:@(spiritId) forKey:@"spiritId"];
    [self postToUrl:url withParams:params :completion];
}

- (void)addMixerWithId: (NSInteger)mixerId ToInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/add-mixer", (long)eventId]];
    NSDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:password forKey:@"passphrase"];
    [params setValue:@(mixerId) forKey:@"mixerId"];
    [self postToUrl:url withParams:params :completion];
}

- (void)removeMixerWithId:(NSInteger)mixerId FromInventoryForEventWithId:(NSInteger)eventId withPassword:(NSString *)password :(void (^)(NSURLSessionDataTask *, NSArray *))completion {
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/remove-mixer", (long)eventId]];
    NSDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:password forKey:@"passphrase"];
    [params setValue:@(mixerId) forKey:@"mixerId"];
    [self postToUrl:url withParams:params :completion];
}


- (void)getFromUrl:(NSString *)url :(void(^)(NSArray *))completion {
    [self.manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Success: (GET : %@)", url);
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failure: (GET : %@) \nReason: %@", url, error);
        completion(nil);
    }];
}

- (void)postToUrl:(NSString *)url withParams:(NSDictionary *)params :(void(^)(NSURLSessionDataTask *, NSArray *))completion {
    [self.manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Success: (POST : %@)", url);
        completion(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failure: (POST : %@) \nReason: %@", url, error);
        completion(task, nil);
    }];
}



@end
