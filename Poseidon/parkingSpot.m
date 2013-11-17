//
//  parkingSpot.m
//  Poseidon
//
//  Created by Shervin Shaikh on 11/16/13.
//  Copyright (c) 2013 Shervin Shaikh. All rights reserved.
//

#import "parkingSpot.h"

@implementation parkingSpot

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title thumbnail:(NSString *)thumbnail
{
    if ((self = [super init]))
    {
        self.coordinate = coordinate;
        self.title = title;
        self.thumbnail = thumbnail;
    }
    return self;
}

@end
