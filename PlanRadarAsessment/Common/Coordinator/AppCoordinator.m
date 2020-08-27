//
//  AppCoordinator.m
//  FreeNowTask
//
//  Created by Hazem Maher on 13/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

#import "AppCoordinator.h"
#import "PlanRadarAsessment-Swift.h"

@interface AppCoordinator()

@property (strong, nonatomic) id <Router> router;

@end

@implementation AppCoordinator

#pragma mark - Init

- (instancetype)initWithRouter:(id <Router>)router {
    if (self = [super init]) {
        self.router = router;
    }
    return self;
}

#pragma mark - Overriden

- (void)start {
    //VehicleListCoordinator * coordinator = [[VehicleListCoordinator alloc] initWithWindow:self.window];
    //[self coordinateTo:coordinator];
}

@end
