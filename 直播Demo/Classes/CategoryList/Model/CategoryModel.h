//
//  CategoryModel.h
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "JSONModel.h"
//#import <JSONModel/JSONModel.h>
@interface CategoryModel : JSONModel

@property (nonatomic,copy) NSString *slug;
@property (nonatomic,copy) NSString *first_letter;
@property (nonatomic,assign) NSInteger status;
//id -> ID
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,assign) NSInteger prompt;
@property (nonatomic,strong) NSURL *image;
@property (nonatomic,strong) NSURL *thumb;
@property (nonatomic,assign) NSInteger priority;
@property (nonatomic,copy) NSString *name;


@end
