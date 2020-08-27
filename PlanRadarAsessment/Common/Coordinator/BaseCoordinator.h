//
//  BaseCoordinator.h
//  FreeNowTask
//
//  Created by Hazem Maher on 13/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCoordinator : NSObject

#pragma mark - Methods

- (void)coordinateTo:(BaseCoordinator *)coordinator;
- (void)free:(BaseCoordinator *)coordinator;
- (void)start;

@end

