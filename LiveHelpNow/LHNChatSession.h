//
//  LHNChatSession.h
//  Pods
//
//  Created by Justin Schneck on 12/8/15.
//
//

#import <Foundation/Foundation.h>

typedef enum {
    LHNChatConnecting   = 0,
    LHNChatOpen         = 1,
    LHNChatClosing      = 2,
    LHNChatClosed       = 3,
} LHNChatConnectionState;

typedef enum {
    LHNChannelCommandEndChat = 0
} LHNChannelCommand;

@class LHNChatSession;

@protocol LHNChatSession <NSObject>
- (void)chatSession:(LHNChatSession*)chatSession didBegin:(NSDictionary*)state;
- (void)chatSession:(LHNChatSession*)chatSession stateChanged:(NSDictionary*)state;
- (void)chatSession:(LHNChatSession*)chatSession receivedMessage:(NSDictionary*)message;

- (void)chatSession:(LHNChatSession*)chatSession didEnd:(NSDictionary*)state;

@end

@class LHNPreChatViewController;

@interface LHNChatSession : NSObject

+ (void)prechatFormForWindow:(int)window
                  completion:(void (^)(NSArray *fieldSet))completion
                       error:(void (^)(NSError *error))error;


- (instancetype)initWithWindow:(int)window;
- (instancetype)initWithWindow:(int)window prechat:(NSDictionary*)prechat;
@end
