//
//  BaseNavView.m
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/3/31.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "BaseNavView.h"
#import "Header.h"

@interface BaseNavView ()

@property(nonatomic,strong) UIView *bgNaviView, *downBkgv;

@end
@implementation BaseNavView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
        [self upUIFrame];
    }
    return self;
}

- (void)creatUI{
    [self addSubview:self.bgNaviView];
    [self.bgNaviView addSubview:self.downBkgv];
    //左
    [self.downBkgv addSubview:self.leftImgv];
    [self.downBkgv addSubview:self.leftBtn];
    //题目
    [self.downBkgv addSubview:self.titL];
    //右
    [self.downBkgv addSubview:self.rightImgv];
    [self.downBkgv addSubview:self.rightBtn];
}

- (void)upUIFrame{
    CGFloat height_top  = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat height_navi = 44.0;
    [self.bgNaviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(height_top+height_navi);
    }];
    //导航栏下部背景
    [self.downBkgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(height_navi);
    }];
   
    //左键
    [self.leftImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.downBkgv.mas_left).mas_offset(12);
        make.centerY.mas_equalTo(self.downBkgv.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(9, 17));
    }];
    //左键事件
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self.downBkgv);
        make.width.mas_equalTo(60);
    }];
    
    //题目
    [self.titL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftImgv.mas_centerY);
        make.centerX.mas_equalTo(self.downBkgv.mas_centerX);
        make.left.mas_greaterThanOrEqualTo(self.leftBtn.mas_right).mas_offset(15);
    }];
    //购物车
    [self.rightImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.downBkgv.mas_centerY);
        make.right.mas_equalTo(self.downBkgv.mas_right).mas_offset(-15);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    //右键
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(self.downBkgv);
        make.width.mas_equalTo(70);
    }];
}

#pragma mark -- leftBtnClick 左键 --
-(void)leftBtnClick:(UIButton *)sender{
    if (self.BaseNavViewBlock)
    {
        self.BaseNavViewBlock(Left_Nav_Btn);
    }
}
#pragma mark -- jumpSouSuoPage 右键 --
-(void)rightBtnClick:(UITapGestureRecognizer *)tap{
    if (self.BaseNavViewBlock)
    {
        self.BaseNavViewBlock(Right_Nav_Btn);
    }
}

- (UIView *)bgNaviView{
    if (nil==_bgNaviView) {
        _bgNaviView = [[UIView alloc]init];
        _bgNaviView.backgroundColor = [UIColor whiteColor];
    }
    return _bgNaviView;
}

-(UIView *)downBkgv{
    if (!_downBkgv) {
        _downBkgv = [[UIView alloc]init];
        _downBkgv.userInteractionEnabled = YES;
        _downBkgv.backgroundColor = [UIColor whiteColor];
    }
    return _downBkgv;
}

- (UILabel *)titL{
    if (!_titL) {
        _titL = [[UILabel alloc]init];
        _titL.textColor = TEXT_HEX_BLOCK_66;
        _titL.font = TEXT_BIG_B_FONT20;
        _titL.text = @"题目";
        _titL.userInteractionEnabled = YES;
        [_titL setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _titL;
}

-(UIImageView *)leftImgv{
    if (!_leftImgv) {
        _leftImgv = [[UIImageView alloc]init];
        _leftImgv.image = [UIImage imageNamed:@"fanhui-icon"];
        _leftImgv.userInteractionEnabled = YES;
    }
    return _leftImgv;
}
-(UIButton *)leftBtn{
    if(!_leftBtn){
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}
-(UIImageView *)rightImgv{
    if (!_rightImgv) {
        _rightImgv = [[UIImageView alloc]init];
        _rightImgv.image = [UIImage imageNamed:@"scart"];
        _rightImgv.userInteractionEnabled = YES;
    }
    return _rightImgv;
}
-(UIButton *)rightBtn{
    if(!_rightBtn){
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

@end
