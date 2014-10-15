//
//  NetworkController.m
//  Movie-Search
//
//  Created by Taylor Mott on 10.8.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "NetworkController.h"

static NSString * const API_KEY = @"53e0bfbe5a380567f77ec24bafd01593";

@implementation NetworkController

+ (AFHTTPSessionManager *)api {
    
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.themoviedb.org/3/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
        
    });
    return api;
}

+ (NSDictionary *)parametersWithAPIKey:(NSDictionary *)parameters
{
    NSMutableDictionary *mutableDictionary = [parameters mutableCopy];
    
    [mutableDictionary setObject:API_KEY forKey:@"api_key"];
    
    return [mutableDictionary copy];
}

+ (NSDictionary *)apiKey
{
    return @{@"api_key":API_KEY};
}

@end
