//
//  MSMovieDetailViewController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//


#import "MSMovieDetailViewController.h"
#import "MovieController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface MSMovieDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation MSMovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *movieResults = [MovieController sharedInstance].movieDetail;
    self.titleLabel.text = [movieResults objectForKey:@"original_title"];
    self.dateLabel.text = [self getDate:[movieResults objectForKey:@"release_date"]];
    self.ratingLabel.text = [NSString stringWithFormat:@"%@", [movieResults objectForKey:@"vote_average"]];
    self.voteCountLabel.text = [NSString stringWithFormat:@"%@", [movieResults objectForKey:@"vote_count"]];
    self.taglineLabel.text = [movieResults objectForKey:@"tagline"];
    self.descriptionLabel.text = [movieResults objectForKey:@"overview"];
    [self.image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.tmdb.org/t/p/w92%@", [movieResults objectForKey:@"poster_path"]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getDate:(NSString *)dateString
{
    NSString *date = @"";
    if (![dateString isEqualToString:@""])
    {
        NSString *year = [[dateString componentsSeparatedByString:@"-"] objectAtIndex:0];
        NSString *month = [[dateString componentsSeparatedByString:@"-"] objectAtIndex:1];
        NSString *day = [[dateString componentsSeparatedByString:@"-"] objectAtIndex:2];
        
        month = [self getMonthFromNumber:[month intValue]];
        
        date = [NSString stringWithFormat:@"%@ %@ %@", day, month, year];
    }
    
    return date;
}

- (NSString *)getMonthFromNumber:(int)monthNumber
{
    NSString *month;
    switch (monthNumber)
    {
        case 1:
            month = @"January";
            break;
        case 2:
            month = @"February";
            break;
        case 3:
            month = @"March";
            break;
        case 4:
            month = @"April";
            break;
        case 5:
            month = @"May";
            break;
        case 6:
            month = @"June";
            break;
        case 7:
            month = @"July";
            break;
        case 8:
            month = @"August";
            break;
        case 9:
            month = @"September";
            break;
        case 10:
            month = @"October";
            break;
        case 11:
            month = @"November";
            break;
        case 12:
            month = @"December";
            break;
    }
    return month;
}

@end
