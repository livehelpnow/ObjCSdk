//
//  LHNVisitor.m
//  Pods
//
//  Created by Justin Schneck on 12/7/15.
//
//

#import "LHNVisitor.h"
#import "LiveHelpNow_Private.h"

@implementation LHNVisitor

//- (instancetype)init {
//     return [self initWithDepartment:0];
//}

- (instancetype)initWithDepartment:(int)department
                        completion:(void (^)(void))completion
                             error:(void (^)(NSError *error))errorBlock {
    self = [super init];
    if (self) {
        AFHTTPRequestOperationManager *manager = [LiveHelpNow operationManager];
        NSDictionary *params = @{
                                 @"java":@"No",
                                 @"res":@"",
                                 @"depth":@"",
                                 @"custom1":@"",
                                 @"custom2":@"",
                                 @"custom3":@"",
                                 @"dept":[NSNumber numberWithInt:department],
                                 @"cookie":@"",
                                 @"referrer":@"",
                                 @"pagetitle":@"",
                                 @"pageurl":@""
                                 };
        [manager POST:@"/api/visitor/init" parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSLog(@"Visitor Init Success: %@", responseObject);
            completion();
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"Visitor Init Error: %@", error);
            errorBlock(error);
        }];
    }
    return self;
}

@end
