//
//  RoomModel.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "RoomModel.h"

@implementation RoomModel

- (NSURL<Ignore> *)playURL {
    
    if (!_playURL) {
        
        _playURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://hls.quanmin.tv/live/%@/playlist.m3u8",self.uid]];
        
    }
    return _playURL;
}
@end
