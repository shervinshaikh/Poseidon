//
//  ParkViewController.m
//  Poseidon
//
//  Created by Shervin Shaikh on 11/16/13.
//  Copyright (c) 2013 Shervin Shaikh. All rights reserved.
//

#import "ParkViewController.h"
#import "parkingSpot.h"

#define METERS_PER_MILE 1609.344

@interface ParkViewController ()

@end

@implementation ParkViewController

@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 34.420200;
    coordinate1.longitude = -119.700000;
    parkingSpot *spot = [[parkingSpot alloc] initWithCoordinate:coordinate1
                                                          title:@"Parking #1"];
    [self.mapView addAnnotation:spot];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 34.423514;
    coordinate2.longitude = -119.701788;
    parkingSpot *spot2 = [[parkingSpot alloc] initWithCoordinate:coordinate2
                                                           title:@"Parking #2"];
    [self.mapView addAnnotation:spot2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 34.417814;
    coordinate3.longitude = -119.699188;
    parkingSpot *spot3 = [[parkingSpot alloc] initWithCoordinate:coordinate3
                                                           title:@"Parking #3"];
    [self.mapView addAnnotation:spot3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 34.419514;
    zoomLocation.longitude = -119.699888;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.8*METERS_PER_MILE, 0.8*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    } else {
        annotationView.annotation = annotation;
    }
    
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

@end
