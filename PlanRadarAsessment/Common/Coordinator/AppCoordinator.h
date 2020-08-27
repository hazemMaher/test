//
//  AppCoordinator.h
//  FreeNowTask
//
//  Created by Hazem Maher on 13/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCoordinator.h"

@protocol Router;

@interface AppCoordinator : BaseCoordinator

#pragma mark - Properties

- (instancetype)initWithRouter:(id <Router>)router;

@end

