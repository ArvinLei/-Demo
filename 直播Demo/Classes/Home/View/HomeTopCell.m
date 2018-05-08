//
//  HomeTopCell.m
//  直播Demo
//
//  Created by simple雨 on 2018/5/3.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "HomeTopCell.h"

#import "LoopView.h"
@implementation HomeTopCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.lv = [[LoopView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 210)];
        [self addSubview:self.lv];
        
        self.slv = [[SmallLoopView alloc]initWithFrame:CGRectMake(0, 210, self.bounds.size.width, 100)];
        [self addSubview:self.slv];
    }
    return self;
    
}

- (void)setRooms:(NSArray *)rooms {
    _rooms = rooms;
    
    self.lv.rooms = rooms;
    
}

- (void)setUserRooms:(NSArray *)userRooms {
    _userRooms = userRooms;
    
    self.slv.rooms = userRooms;
    
}
@end
