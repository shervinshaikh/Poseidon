//
//  ParkViewController.m
//  Poseidon
//
//  Created by Shervin Shaikh on 11/16/13.
//  Copyright (c) 2013 Shervin Shaikh. All rights reserved.
//

#import "ParkViewController.h"
#import "parkingSpot.h"
#import "SpotView.h"

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
                                                          title:@"$50"
                                                      thumbnail:@"car-icon3.png"];
    [self.mapView addAnnotation:spot];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 34.423514;
    coordinate2.longitude = -119.701788;
    parkingSpot *spot2 = [[parkingSpot alloc] initWithCoordinate:coordinate2
                                                           title:@"$3"
                                                       thumbnail:@"car-icon2.png"];
    [self.mapView addAnnotation:spot2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 34.417814;
    coordinate3.longitude = -119.699188;
    parkingSpot *spot3 = [[parkingSpot alloc] initWithCoordinate:coordinate3
                                                           title:@"$34"
                                                       thumbnail:@"car-icon2.png"];
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
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.mapView setRegion:viewRegion animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"myAnnotation";
    MKAnnotationView * annotationView = (MKAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                         reuseIdentifier:identifier];
        // To use an image for the pin:
        annotationView.image = [UIImage imageNamed:((parkingSpot *)annotation).thumbnail];
        annotationView.canShowCallout = YES;
    } else {
        annotationView.annotation = annotation;
    }
    
    annotationView.leftCalloutAccessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    UILabel *distanceText = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
    distanceText.text = @"1 mi";
    [distanceText setFont:[UIFont fontWithName: @"Trebuchet MS" size: 16.0f]];
    [annotationView.leftCalloutAccessoryView addSubview:distanceText];
    
    annotationView.leftCalloutAccessoryView.backgroundColor = [UIColor colorWithRed:106.0/255.0 green:226.0/255.0 blue:102.0/255.0 alpha:1.0];
    
    UIButton *information = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.rightCalloutAccessoryView = information;
    return annotationView;
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    NSLog(view.annotation);
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController pushViewController:dvc animated:YES];

}

//-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)controlindexPath {
////    DetailVC *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
////    dvc.address = [self.tweetsArray objectAtIndex:indexPath.row];
////    [self.navigationController pushViewController:dvc animated:YES];
//    NSLog(@"clicked");
//    DetailViewController *dvc = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//     dvc.title = view.annotation.title;
//     dvc.address = view.annotation.subtitle;
////     [self ParkViewController:dvc animated:YES];
//}

//- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
//{
//    if(![view.annotation isKindOfClass:[MKUserLocation class]]) {
//        SpotView *spotView = (SpotView *)[[[NSBundle mainBundle] loadNibNamed:@"spotView"
//                                                                        owner:self
//                                                                      options:nil] objectAtIndex:0];
//        CGRect spotViewFrame = spotView.frame;
//        spotViewFrame.origin = CGPointMake(-spotViewFrame.size.width/2 + 15, -spotViewFrame.size.height);
//        spotView.frame = spotViewFrame;
//        [spotView.spotLabel setText:[(parkingSpot*)[view annotation] title]];
//        [view addSubview:spotView];
//    }
//    
//}

//-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
//    for (UIView *subview in view.subviews ){
//        [subview removeFromSuperview];
//    }
//}

@end
