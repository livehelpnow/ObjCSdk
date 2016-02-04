//
//  LHNHTTPRequestOperationManager.m
//  Pods
//
//  Created by Justin Schneck on 12/15/15.
//
//

#import "LHNHTTPRequestOperationManager.h"

@interface LHNHTTPRequestOperationManager ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation LHNHTTPRequestOperationManager

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        [self.queue setSuspended:YES];
    }
    return self;
}

- (nullable AFHTTPRequestOperation *)POST:(NSString *)URLString
                               parameters:(nullable id)parameters
                                  success:(nullable void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                  failure:(nullable void (^)(AFHTTPRequestOperation * __nullable operation, NSError *error))failure {
    // Check the ready state.
    if (!self.authenticated) {
        NSLog(@"Queue Operation: %@", URLString);
        [self.queue addOperationWithBlock:^{
            [super POST:URLString parameters:parameters success:success failure:failure];
        }];
        return nil;
    }
    NSLog(@"Execute Operation: %@", URLString);
    return [super POST:URLString parameters:parameters success:success failure:failure];
}

- (nullable AFHTTPRequestOperation *)GET:(NSString *)URLString
                              parameters:(id)parameters
                                 success:(void (^)(AFHTTPRequestOperation * _Nonnull, id _Nonnull))success
                                 failure:(void (^)(AFHTTPRequestOperation * _Nullable, NSError * _Nonnull))failure {
    // Check the ready state.
    if (!self.authenticated) {
        NSLog(@"Queue Operation: %@", URLString);
        [self.queue addOperationWithBlock:^{
            [super GET:URLString parameters:parameters success:success failure:failure];
        }];
        return nil;
    }
    NSLog(@"Execute Operation: %@", URLString);
    return [super GET:URLString parameters:parameters success:success failure:failure];
}

- (void)setAuthenticated:(BOOL)authenticated {
    NSLog(@"Set Authenticated: %i", authenticated);
    _authenticated = authenticated;
    [self.queue setSuspended:!authenticated];
}
@end
