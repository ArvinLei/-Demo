//
//  HomeViewController.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "HomeViewController.h"

#import <SVPullToRefresh.h>
#import "SearchingViewController.h"
#import "RoomCell.h"
#import "RoomModel.h"
#import "HomeTopCell.h"
#import "HomeSectionHeaderView.h"
#import "LiveListViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "RoomViewController.h"

@interface HomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LoopViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSDictionary *homeInfoDic;
@property (nonatomic,strong) NSArray *listArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"搜索_默认"] style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    
   //创建CollectionView 代码
    UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:fl];
    collectionView.backgroundColor = LGRGBA(240, 240, 240, 1);
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    //注册
    [collectionView registerClass:[HomeTopCell class] forCellWithReuseIdentifier:@"topCell"];
    
    //注册Cell
    [collectionView registerClass:[RoomCell class] forCellWithReuseIdentifier:@"cell"];
    collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    __weak typeof (self) weakSelf = self;
    
    //添加下拉刷新
    [self.collectionView addPullToRefreshWithActionHandler:^{
        
        [WebUtils requestHomeInfoWithCallback:^(id obj) {
        
            weakSelf.homeInfoDic = obj;
            
            weakSelf.listArr = obj[@"list"];
            
            [weakSelf.collectionView reloadData];
            
            [collectionView.pullToRefreshView stopAnimating];
        
        }];
        
    }];
    [self.collectionView triggerPullToRefresh];
    
    //注册组头
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeSectionHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView"];
    
}
- (void)searchAction {
    SearchingViewController *vc = [SearchingViewController new];
    [self.navigationController pushViewController:vc animated:YES];

}

#pragma mark UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //因为字典中有多余的数据 所以需要-2
    return self.homeInfoDic.count-2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    if (section == 2) {
        return 4;
    }
    return 2;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        HomeTopCell *topCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
        topCell.rooms = self.homeInfoDic[@"mobile-index"];
        
        topCell.lv.delegate = self;
        
        topCell.userRooms = self.homeInfoDic[@"mobile-lol"];
        return topCell;
    }
    
    //得到目录里面相对应的字典
    NSDictionary *dic = self.listArr[indexPath.section+1];
    //取到key
    NSString *key = dic[@"slug"];
    
    //通过key得到字典中对应的房间数组
    NSArray *rooms = self.homeInfoDic[key];
    RoomModel *room = nil;

    if (indexPath.section == 1) {//如果是推荐 随机取
        //rooms.count+1  防止分母为0
        room = rooms[arc4random()%rooms.count];
    }else {//除了推荐 其他的是从数组中挨个取
        room = rooms[indexPath.row];
    }
    
    
    RoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
   cell.room = room;
    
    return cell;
    
}

//控制显示大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return CGSizeMake(LGSW, 210+110);
    }
    float size = (LGSW-3*LGMargin)/2;
    return CGSizeMake(size, size*.8);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, LGMargin, 0, LGMargin);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LGMargin;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return LGMargin;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.listArr[indexPath.section+1];
    //取到key
    NSString *key = dic[@"slug"];
    //通过key得到字典中对应的房间数组
    NSArray *rooms = self.homeInfoDic[key];
    RoomModel *room = rooms[indexPath.row];
    
    RoomViewController *Rvc = [RoomViewController new];
    Rvc.playURL = room.playURL;
    //隐藏tabbar
    Rvc.hidesBottomBarWhenPushed = YES;
    
    //需要导入<AVFoundation>和AVKit
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:room.playURL];
    [vc.player play];
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HomeSectionHeaderView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView" forIndexPath:indexPath];
        NSDictionary *dic = self.listArr[indexPath.section+1];
        view.titleLable.text = dic[@"name"];
        
        if ([view.titleLable.text isEqualToString:@"精彩推荐"]) {
            [view.rightBtn setTitle:@"换一换" forState:UIControlStateNormal];
            [view.rightBtn setImage:[UIImage imageNamed:@"换一换"] forState:UIControlStateNormal];
        }else {
            [view.rightBtn setTitle:@"更多" forState:UIControlStateNormal];
            [view.rightBtn setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        }
        view.rightBtn.tag = indexPath.section+1;
        //给组头里面的按钮添加点击事件
        [view.rightBtn addTarget:self action:@selector(sectionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }

    return view;
}

- (void)sectionBtnAction:(UIButton *)btn {

    if ([[btn titleForState:UIControlStateNormal]isEqualToString:@"换一换"]) {
        //重新刷新推荐这一组
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
    }else {

        NSDictionary *dic = self.listArr[btn.tag];

        NSString *slug = dic[@"category_slug"];

        LiveListViewController *vc = [LiveListViewController new];
        vc.slug = slug;
        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section > 0) {
        return CGSizeMake(0, 40);//宽度无用，永远与collectionView同宽
        
    }
    return CGSizeZero;
   
}

#pragma mark LoopViewDelegate
- (void)didTapItemWithRoomPath:(NSURL *)path {
    
    RoomViewController *vc = [RoomViewController new];
    vc.playURL = path;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

//是否支持旋转
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    //只支持竖屏
    return UIInterfaceOrientationMaskPortrait;
}
@end
