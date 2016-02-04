//
//  LiveHelpNow.h
//  LiveHelpNow
//
//  Created by Justin Schneck on 12/2/15.
//  Copyright © 2015 LiveHelpNow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LiveHelpNow/LHNVisitor.h>
#import <LiveHelpNow/LHNChatSession.h>

@interface LiveHelpNow : NSObject

+ (void)initWithAppId:(NSString*)appId appSecret:(NSString*)appSecret;

+ (NSString*)appId;
+ (NSString*)appSecret;

+ (NSURL*)baseURL;

+ (void)authenticate;

@end
