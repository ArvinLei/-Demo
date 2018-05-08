//
//  RoomCell.h
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RoomModel.h"

@interface RoomCell : UICollectionViewCell

@property (nonatomic,strong) RoomModel *room;

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UIImageView *roomIV;

@property (nonatomic,strong) UIButton *userNameBtn;

@property (nonatomic,strong) UIButton *userCountBtn;

@property (nonatomic,strong) UIView *bgView;


@end
