//
//  WelcomeViewController.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "WelcomeViewController.h"

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface WelcomeViewController ()

@property (strong,nonatomic) NSArray<UIImage *> *imageList;
@property (strong,nonatomic) AVPlayerLayer *layer;

@end

@implementation WelcomeViewController

#pragma mark  LazyLoad

- (NSArray<UIImage *> *)imageList {
    
    if (!_imageList) {
        
        NSArray *imageNames960 = @[@"0welcome960", @"1welcome960", @"2welcome960"];
        NSArray *imageNames1136 = @[@"0welcome1136", @"1welcome1136", @"2welcome1136"];
        NSArray *imageNames1334 = @[@"0welcome1334", @"1welcome1334", @"2welcome1334"];
        NSArray *imageNames1472 = @[@"0welcome1472", @"1welcome1472", @"2welcome1472"];
        CGFloat height = [UIScreen mainScreen].nativeBounds.size.height;
        
        NSArray *imageNames = nil;
        
        if (height == 960) {
            imageNames = imageNames960;
        }
        if (height == 1136) {
            imageNames = imageNames1136;
        }
        if (height == 1334) {
            imageNames = imageNames1334;
        }
        //真机iphone6p的高度是1920
        if (height == 2208||height == 1920) {
            //iphone6p的高度是2208, 美工命名有问题!
            imageNames = imageNames1472;
        }
        
        NSMutableArray *tmpArr = [NSMutableArray new];
        
        for (NSString *obj in imageNames) {
            [tmpArr addObject:[UIImage imageNamed:obj]];
        }
        
        _imageList = tmpArr.copy;
    }
    return _imageList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = @"/Users/simpleyu/Desktop/直播Demo/dyla_movie.mp4";
    
    //创建一个播放项
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:[AVAsset assetWithURL:[NSURL fileURLWithPath:path]]];
    //创建网络地址的播放项
//    AVPlayerItem *webItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@""]];
    
    //创建播放器对象
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    //创建播放的layer
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    layer.frame = [UIScreen mainScreen].bounds;
    //设置填充模式
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //把播放layer 添加到界面中
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    [player play];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playFinishedAction) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
- (void)playFinishedAction {
    
    [self.layer removeFromSuperlayer];
    
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    sv.pagingEnabled = YES;
    [self.view addSubview:sv];
    
    for (int i = 0; i <self.imageList.count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*LGSW, 0, LGSW, LGSH)];
        iv.image = self.imageList[i];
        iv.userInteractionEnabled = YES;
        [sv addSubview:iv];
        //最后一张
        if (i == self.imageList.count-1) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
            [iv addGestureRecognizer:tap];
        }
    }
    sv.contentSize = CGSizeMake(self.imageList.count*LGSW, 0);
}

- (void)tapAction {
    
    [UIView animateWithDuration:1 animations:^{
        
        self.view.window.alpha = 0;
        self.view.window.transform = CGAffineTransformMakeScale(2, 2);
    } completion:^(BOOL finished) {
        AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
        app.welcomeWindow.hidden = YES;
        app.welcomeWindow = nil;
        
    }];
    //获取系统版本号
    NSDictionary *dic = [NSBundle mainBundle].infoDictionary;
    NSString *version = dic[@"CFBundleShortVersionString"];
    
    [[NSUserDefaults standardUserDefaults]setObject:version forKey:@"version"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
