//
//  LiveHelpNow.m
//  LiveHelpNow
//
//  Created by Justin Schneck on 12/2/15.
//  Copyright © 2015 LiveHelpNow. All rights reserved.
//

#import "LiveHelpNow.h"
#import "LiveHelpNow_Private.h"
#import <AFOAuth2Manager/AFHTTPRequestSerializer+OAuth2.h>

NSString * const CREDENTIAL_IDENTIFIER = @"net.livehelpnow.api";

NSString *__appId;
NSString *__appSecret;
LHNHTTPRequestOperationManager *__operationManager;

@implementation LiveHelpNow

+ (void)initWithAppId:(NSString *)appId appSecret:(NSString *)appSecret {
    __appId = appId;
    __appSecret = appSecret;
}

+ (NSString*)appId {return __appId;}
+ (NSString*)appSecret {return __appSecret;}

+ (NSURL*)baseURL {return
    //[NSURL URLWithString:@"https://developer.livehelpnow.net"];
    [NSURL URLWithString:@"http://localhost:4002"];
}

+ (LHNHTTPRequestOperationManager*)operationManager {
    if (__operationManager == nil) {
        __operationManager =
        [[LHNHTTPRequestOperationManager alloc] initWithBaseURL:[self baseURL]];
    }
    AFOAuthCredential *credential = [AFOAuthCredential retrieveCredentialWithIdentifier:CREDENTIAL_IDENTIFIER];
    [__operationManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", credential.accessToken] forHTTPHeaderField:@"Authorization"];
    return __operationManager;
}

+ (void)authenticate {
    AFOAuth2Manager *OAuth2Manager =
    [[AFOAuth2Manager alloc] initWithBaseURL:[self baseURL]
                                    clientID:[self appId]
                                      secret:[self appSecret]];
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"/oauth/token"
                                            parameters:@{@"grant_type":@"client_credentials", @"client_id":[self appId], @"client_secret":[self appSecret]}
                                               success:^(AFOAuthCredential *credential) {
        NSLog(@"Authentication Successful");
        [AFOAuthCredential storeCredential:credential withIdentifier:CREDENTIAL_IDENTIFIER];
        [self.operationManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", credential.accessToken] forHTTPHeaderField:@"Authorization"];
                                                   [self.operationManager setAuthenticated:YES];
    } failure:^(NSError *error) {
        NSLog(@"Authentication Failure: %@", [error localizedDescription]);
    }];
}

@end
