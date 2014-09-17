//
//  PPDirectionsViewController.m
//  World Traveler
//
//  Created by David Pirih on 17.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "PPDirectionsViewController.h"
#import "PPDirectionsListViewController.h"

@interface PPDirectionsViewController ()

@end

@implementation PPDirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    
    self.directionsMapView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)listDirectionsAction:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"directionsToListSegue" sender:sender];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PPDirectionsListViewController class]]) {
        PPDirectionsListViewController *directionsListViewController = segue.destinationViewController;
        directionsListViewController.steps = self.steps;
    }
}

#pragma mark - CLLocationManager Delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    [manager stopUpdatingLocation];
    
    self.directionsMapView.showsUserLocation = YES;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, 3000, 3000);
    [self.directionsMapView setRegion:[self.directionsMapView regionThatFits:region] animated:YES];
    
    float latitude = [self.venue.location.lat floatValue];
    float longitude = [self.venue.location.lng floatValue];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(latitude, longitude) addressDictionary:nil];
    MKMapItem *destinationMapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    [self getDirections:destinationMapItem];
}

#pragma mark - Directions Methods

- (void)getDirections:(MKMapItem *)destination {
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    request.destination = destination;
    
    request.requestsAlternateRoutes = YES;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            // error handling
            NSLog(@"Error: %@", error.localizedDescription);
        }
        else {
            // do something with directions here
            [self showRoute:response];
        }
    }];
}

#pragma mark - Route Helper

- (void)showRoute:(MKDirectionsResponse *)response
{
    self.steps = response.routes;
    for (MKRoute *route in self.steps) {
        [self.directionsMapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps) {
            NSLog(@"step instructions %@", step.instructions);
        }
    }
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *render = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    render.strokeColor = [UIColor magentaColor];
    render.lineWidth = 3.0;
    
    return render;
}

@end
