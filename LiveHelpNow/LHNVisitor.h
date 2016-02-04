//
//  LHNVisitor.h
//  Pods
//
//  Created by Justin Schneck on 12/7/15.
//
//

#import <Foundation/Foundation.h>

@interface LHNVisitor : NSObject

- (instancetype)initWithDepartment:(int)department
                        completion:(void (^)(void))completion
                             error:(void (^)(NSError *error))error;

@end
