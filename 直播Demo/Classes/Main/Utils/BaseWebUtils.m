//
//  BaseWebUtils.m
//  直播Demo
//
//  Created by simple雨 on 2018/5/1.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "BaseWebUtils.h"

@implementation BaseWebUtils

+ (void)Get:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

        callback(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        callback(nil);
        
    }];
    
    
}

+ (void)Post:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:path parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *s = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",s);
        callback(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        callback(nil);
        
    }];
    
}
@end
