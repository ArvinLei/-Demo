//
//  LoopView.h
//  直播Demo
//
//  Created by simple雨 on 2018/5/3.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoopViewDelegate <NSObject>

- (void)didTapItemWithRoomPath:(NSURL *)path;

@end

@interface LoopView : UIView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,strong) UICollectionView *cv;
@property (nonatomic,strong) NSArray *rooms;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIPageControl *pageControl;

@property (nonatomic,weak) id<LoopViewDelegate
> delegate;

@end
