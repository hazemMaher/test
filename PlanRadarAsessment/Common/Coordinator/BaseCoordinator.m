//
//  BaseCoordinator.m
//  FreeNowTask
//
//  Created by Hazem Maher on 13/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

#import "BaseCoordinator.h"

@interface BaseCoordinator()

@property (strong, nonatomic) NSUUID *identifier;
@property (strong, nonatomic) NSMutableDictionary *childCoordinators;

@end

@implementation BaseCoordinator

#pragma mark - Init
- (instancetype)init {
    if (self = [super init]) {
        self.identifier = [NSUUID UUID];
        self.childCoordinators = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Private
- (void)store:(BaseCoordinator *)coordinator {
    [self.childCoordinators setObject:coordinator forKey:coordinator.identifier];
}

#pragma mark - Public
- (void)free:(BaseCoordinator *)coordinator {
    [self.childCoordinators removeObjectForKey:coordinator.identifier];
}

- (void)coordinateTo:(BaseCoordinator *)coordinator {
    [self store:coordinator];
    [coordinator start];
}

#pragma mark - To be overriden
- (void)start {
    NSAssert(NO, @"Start method must be implemented.");
}

@end
