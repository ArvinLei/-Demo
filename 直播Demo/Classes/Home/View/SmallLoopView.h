//
//  SmallLoopView.h
//  直播Demo
//
//  Created by simple雨 on 2018/5/4.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RoomModel.h"

@interface SmallLoopView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,strong) UICollectionView *cv;
@property (nonatomic,strong) NSArray *rooms;
@property (nonatomic,strong) NSTimer *timer;


@end
