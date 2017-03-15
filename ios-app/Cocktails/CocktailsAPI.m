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
    NSString *url = [API_ENDPOINT stringByAppendingString:[NSString stringWithFormat:@"/events/%ld/spirits?%@", (long)id, password]];
    [self getFromUrl:url :completion];
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



@end
