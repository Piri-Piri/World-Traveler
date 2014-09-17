//
//  MapViewController.m
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "PPMapViewController.h"
#import "PPDirectionsViewController.h"
#import "Location.h"
#import "FSCategory.h"

@interface PPMapViewController ()

@end

@implementation PPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text = self.venue.name;
    self.addressLabel.text = self.venue.location.address;
    
    
    float latitude = [self.venue.location.lat floatValue];
    float longtitude = [self.venue.location.lng floatValue];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longtitude);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 800, 800);
    
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = self.venue.name;
    point.subtitle = self.venue.categories.name;
    
    [self.mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PPDirectionsViewController class]]) {
        PPDirectionsViewController *directionsViewController = segue.destinationViewController;
        directionsViewController.venue = self.venue;
    }
}

#pragma mark - IBActions

- (IBAction)showDirectionsAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"mapToDirectionsSegue" sender:sender];
}
@end
