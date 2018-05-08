//
//  BaseWebUtils.h
//  直播Demo
//
//  Created by simple雨 on 2018/5/1.
//  Copyright © 2018年 simple雨. All rights reserved.
//

typedef void (^MyCallback)(id obj);

#import <Foundation/Foundation.h>

@interface BaseWebUtils : NSObject

+ (void)Get:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback;

+ (void)Post:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback;
@end
