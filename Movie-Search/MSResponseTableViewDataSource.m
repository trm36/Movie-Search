//
//  MSResponseTableViewDataSource.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MSResponseTableViewDataSource.h"
#import "MovieController.h"
#import "MSMovieResultTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

static NSString * const cellReuseKey = @"cell";

@interface MSResponseTableViewDataSource () 

@end

@implementation MSResponseTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[MovieController sharedInstance].resultMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MSMovieResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseKey];
    if (!cell) {
        cell = [[MSMovieResultTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellReuseKey];
    }
    
    NSDictionary *movie = [MovieController sharedInstance].resultMovies[indexPath.row];
    cell.textLabel.text = movie[@"title"];
    NSString *releaseDate = [[movie[@"release_date"] componentsSeparatedByString:@"-"] objectAtIndex:0]; //returns just the year
    NSString *rating = movie[@"vote_average"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", releaseDate, rating];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92%@", movie[@"poster_path"]]]];
    return cell;
}


@end
