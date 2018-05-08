//
//  RoomModel.h
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "JSONModel.h"

@interface RoomModel : JSONModel

@property (nonatomic,copy) NSString<Optional> *default_image;

@property (nonatomic,copy) NSString<Optional> *slug;

@property (nonatomic,copy) NSString<Optional> *weight;

@property (nonatomic,copy) NSString<Optional> *status;

@property (nonatomic,copy) NSString<Optional> *title;

@property (nonatomic,copy) NSString<Optional> *category_name;

@property (nonatomic,strong) NSNumber<Optional> *hidden;

@property (nonatomic,copy) NSString<Optional> *intro;

@property (nonatomic,copy) NSString<Optional> *category_slug;

@property (nonatomic,copy) NSString<Optional> *recommend_image;

@property (nonatomic,copy) NSString<Optional> *play_at;

@property (nonatomic,copy) NSString<Optional> *app_shuffling_image;

@property (nonatomic,copy) NSString<Optional> *level;

@property (nonatomic,copy) NSString<Optional> *uid;

@property (nonatomic,copy) NSString<Optional> *announcement;

@property (nonatomic,copy) NSString<Optional> *nick;

@property (nonatomic,copy) NSString<Optional> *grade;

@property (nonatomic,strong) NSString<Optional> *thumb;

@property (nonatomic,strong) NSURL<Optional> *avatar;

@property (nonatomic,copy) NSString<Optional>
*view;
@property (nonatomic,copy) NSString<Optional> *start_time;

@property (nonatomic,copy) NSString<Optional> *category_id;

@property (nonatomic,strong) NSNumber<Optional> *follow;

@property (nonatomic,copy) NSString<Optional> *create_at;


//Ignore 使用此关键字修饰的话  解析跟它没关系
@property (nonatomic,strong) NSURL<Ignore> *playURL;


@end
