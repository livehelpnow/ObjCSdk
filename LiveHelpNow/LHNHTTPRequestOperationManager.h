//
//  LHNHTTPRequestOperationManager.h
//  Pods
//
//  Created by Justin Schneck on 12/15/15.
//
//

#import <Foundation/Foundation.h>
#import <AFOAuth2Manager/AFOAuth2Manager.h>

@interface LHNHTTPRequestOperationManager : AFHTTPRequestOperationManager

@property (nonatomic) BOOL authenticated;

- (nullable AFHTTPRequestOperation *)POST:(NSString *)URLString
                               parameters:(nullable id)parameters
                                  success:(nullable void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                  failure:(nullable void (^)(AFHTTPRequestOperation * __nullable operation, NSError *error))failure;

@end
