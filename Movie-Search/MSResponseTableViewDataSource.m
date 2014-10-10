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
    NSString *releaseDate = [[movie[@"release_date"] componentsSeparatedByString:@"-"] objectAtIndex:0];
    NSString *separator = @" - ";
    NSString *rating = movie[@"vote_average"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@%@", releaseDate, separator, rating];
    return cell;
}


@end
