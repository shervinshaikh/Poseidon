//
//  ParkViewController.h
//  Poseidon
//
//  Created by Shervin Shaikh on 11/16/13.
//  Copyright (c) 2013 Shervin Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DetailViewController.h"

@interface ParkViewController : UIViewController <MKMapViewDelegate>
    
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
