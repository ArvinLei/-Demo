//
//  WebUtils.h
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

typedef void (^MyCallback)(id obj);

@interface WebUtils : NSObject

+ (void)requestCategoryWithCallback:(MyCallback)callback;
+ (void)requestRoomsWithPage:(int)page andCallback:(MyCallback)callback;

+ (void)requestRoomsWithCategory:(NSString *)category andPage:(int)page andCallback:(MyCallback)callback;
+ (void)requestHomeInfoWithCallback:(MyCallback)callback;
+ (void)requestRoomsWithName:(NSString *)name andCallback:(MyCallback)callback;


@end
