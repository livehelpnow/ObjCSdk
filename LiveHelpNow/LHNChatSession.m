//
//  LHNChatSession.m
//  Pods
//
//  Created by Justin Schneck on 12/8/15.
//
//

#import "LHNChatSession.h"
#import "LiveHelpNow_Private.h"

@implementation LHNChatSession

+ (void)prechatFormForWindow:(int)window completion:(void (^)(NSArray *fieldSet))completion error:(void (^)(NSError *error))errorCallback {
    AFHTTPRequestOperationManager *manager = [LiveHelpNow operationManager];
    NSDictionary *params = @{
                             @"system":@"chat",
                             @"layout":@"mobile",
                             @"partial":@"pre_conversation",
                             @"encoding":@"json",
                             @"view_id":[NSNumber numberWithInt:window],
                             };
    [manager GET:@"/api/ui/form" parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"Prechat Form Success: %@", responseObject);
        completion([responseObject valueForKey:@"payload"]);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"Prechat Form Error: %@", error);
        errorCallback(error);
    }];
}

- (instancetype)init {
    return [self initWithWindow:0 prechat:@{}];
}


- (instancetype)initWithWindow:(int)window prechat:(NSDictionary*)prechat {
    self = [super init];
    if (self) {
        AFHTTPRequestOperationManager *manager = [LiveHelpNow operationManager];
        NSDictionary *params = @{@"view_id":[NSNumber numberWithInt:window], @"prechat_encoding":@"label", @"prechat":prechat};
        [manager POST:@"/api/chat/create" parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSLog(@"Chat Init Success: %@", responseObject);
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"Chat Init Error: %@", error);
        }];
    }
    return self;
}

@end
