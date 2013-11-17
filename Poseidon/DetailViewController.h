//
//  DetailViewController.h
//  Poseidon
//
//  Created by Shervin Shaikh on 11/16/13.
//  Copyright (c) 2013 Shervin Shaikh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelOutlet;
@property (nonatomic, strong) NSString *address;

@end
