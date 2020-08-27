//
//  SessionManager.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AFHTTPSessionManager;

typedef void(^DataTaskCompletionBlock)(id jsonObject, NSError *error);
typedef void(^ImageCompletionBlock)(UIImage *jsonObject, NSError *error);

@protocol RESTClient <NSObject>

- (void)GET:(NSString *)url parameters:(NSDictionary *)parameters completion:(DataTaskCompletionBlock)block;
- (void)downloadImage:(NSString *)url completion:(ImageCompletionBlock)block;
- (void)cancelAllTasks;

@end


@interface RESTClientImplementation : NSObject<RESTClient>

- (instancetype)initWithManager:(AFHTTPSessionManager *)manager;

@end
