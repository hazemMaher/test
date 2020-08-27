//
//  SessionManager.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//


#import "RESTClient.h"
#import "AFHTTPSessionManager.h"
#import <AFNetworking/AFImageDownloader.h>

@interface RESTClientImplementation()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation RESTClientImplementation

#pragma mark - Init

- (instancetype)initWithManager:(AFHTTPSessionManager *)manager {
    if (self = [super init]) {
        self.manager = manager;
    }
    return self;
}

#pragma mark - API

- (void)GET:(NSString *)url parameters:(NSDictionary *)parameters completion:(DataTaskCompletionBlock)block {
    
    [self.manager GET:url
           parameters:parameters
              headers:@{@"":@""}
             progress:NULL
              success:^(NSURLSessionDataTask * task, id jsonObject) {
        
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            block(jsonObject, NULL);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(NULL, error);
    }];
}

- (void)downloadImage:(NSString *)url completion:(ImageCompletionBlock)block {
    
    AFImageDownloader *downloader = [[AFImageDownloader alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: url]];
    [downloader downloadImageForURLRequest:request
                                   success:^(NSURLRequest * request, NSHTTPURLResponse * response, UIImage * image) {
        
        block(image, NULL);
        
    }failure:^(NSURLRequest * request, NSHTTPURLResponse * response, NSError * error) {
        
        block(NULL, error);
    }];
}

- (void)cancelAllTasks {
    for (NSURLSessionDataTask *task in  self.manager.tasks) {
        [task cancel];
    }
}

@end
