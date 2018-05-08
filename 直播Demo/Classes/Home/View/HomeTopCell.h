//
//  HomeTopCell.h
//  直播Demo
//
//  Created by simple雨 on 2018/5/3.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LoopView.h"
#import "SmallLoopView.h"
@interface HomeTopCell : UICollectionViewCell

@property (nonatomic,strong) LoopView *lv;
@property (nonatomic,strong) NSArray *rooms;

@property (nonatomic,strong) SmallLoopView *slv;
@property (nonatomic,strong) NSArray *userRooms;


@end
