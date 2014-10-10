//
//  NetworkController.h
//  Movie-Search
//
//  Created by Taylor Mott on 10.8.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;

+ (NSDictionary *)parametersWithAPIKey:(NSDictionary *)parameters;

@end
