//
//  CategoryCell.m
//  直播Demo
//
//  Created by simple雨 on 2018/4/28.
//  Copyright © 2018年 simple雨. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UILabel *)titleLabel {
    
    if (_titleLabel == nil) {
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 30, self.bounds.size.width, 30)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
    }
    return _titleLabel;
}

- (UIImageView *)iconIV {
    
    if (_iconIV == nil) {
        
        _iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - 30)];
        
        [self.contentView addSubview:_iconIV];
        
    }
    return _iconIV;
}

- (void)setCategory:(CategoryModel *)category {
    _category = category;
    
    self.titleLabel.text = category.name;
    
    [self.iconIV sd_setImageWithURL:category.image placeholderImage:LGLoadingImage];
    
}
@end
