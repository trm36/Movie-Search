//
//  MovieController.h
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;
@property (nonatomic, strong) NSDictionary *movieDetail;

- (void)getMoviesWithName:(NSString *)name completion:(void (^)(BOOL success))completion;
- (void)getMovieWithID:(NSString *)movieID completion:(void (^)(BOOL success))completion;

@end
