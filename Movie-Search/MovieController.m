//
//  MovieController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MovieController.h"
#import "NetworkController.h"
#import <AFNetworking/AFNetworking.h>


@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)getMoviesWithName:(NSString *)name completion:(void (^)(BOOL success))completion
{
    NSString *path = @"search/movie";
    [[NetworkController api] GET:path parameters:[NetworkController parametersWithAPIKey:@{@"query":name}]
    success:
     ^(NSURLSessionDataTask *task, id responseObject)
    {
        self.resultMovies = responseObject[@"results"];
        NSLog(@"get result movie: %@", self.resultMovies);
        completion(YES);
    }
    failure:
     ^(NSURLSessionDataTask *task, NSError *error)
    {
        NSLog(@"Fail");
        completion(NO);
    }];
}


- (void)getMovieWithID:(NSString *)movieID completion:(void (^)(BOOL success))completion
{
    NSString *path = [NSString stringWithFormat:@"movie/%@", movieID];
    [[NetworkController api] GET:path parameters:[NetworkController apiKey]
                         success:^(NSURLSessionDataTask *task, id responseObject)
                         {
                             self.movieDetail = responseObject;
                             NSLog(@"get movie detail: %@", self.movieDetail);
                             completion(YES);
                         }
                         failure:^(NSURLSessionDataTask *task, NSError *error) {
                             completion(NO);
                         }];
}


@end
