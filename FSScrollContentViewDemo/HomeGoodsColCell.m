
//
//  HomeGoodsColCell.m
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/4/9.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "HomeGoodsColCell.h"
#import "Header.h"

@implementation HomeGoodsColCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createVeiw];
    }
    return self;
}

-(void)createVeiw{
    CGFloat cellWidth = (SCREEN_WIDTH-24-10)/2.0;
    //    CGFloat cellHeight = cellWidth*(170/170.0)+10+14+12+12+14+10+15;
    
    
    self.goodsImgv = [[UIImageView alloc]init];
    [self addSubview:self.goodsImgv];
    self.goodsImgv.userInteractionEnabled = YES;
    //    self.goodsImgv.image = [UIImage imageNamed:@"shangpin"];
    self.goodsImgv.layer.cornerRadius = 4;
    self.goodsImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self.goodsImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(cellWidth, cellWidth));
    }];
    self.goodsImgv.backgroundColor = [UIColor whiteColor];
    
    //题目
    self.tiMuL = [[UILabel alloc]init];
    self.tiMuL.font = TEXT_MIDD_S_FONT15;
    self.tiMuL.textColor = TEXT_HEX_BLOCK_66;
    [self addSubview:self.tiMuL];
    self.tiMuL.text = @"饼肥有机大米饼肥有机大米";
    [self.tiMuL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goodsImgv.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.goodsImgv.mas_left);
        make.width.mas_lessThanOrEqualTo(cellWidth);
    }];

    //价格
    self.priceL = [[UILabel alloc]init];
    self.priceL.font = TEXT_LIT_S_FONT13;
    self.priceL.textColor = TEXT_RED_Price;
    [self addSubview:self.priceL];
    //shuju
    //    self.priceL.attributedText = [GetDiffFonString getTheDiffWithString:str_str withSeparate:@"/" withBigFont:MIDDLE_FONT withSmallFont:[UIFont systemFontOfSize:10]];
    self.priceL.text = @"¥139";
    [self.priceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tiMuL.mas_bottom).mas_offset(12);
        make.left.mas_equalTo(self.goodsImgv.mas_left);
    }];
    //详情
    self.descL = [[UILabel alloc]init];
    self.descL.font = TEXT_LIT_S_FONT12;
    self.descL.textColor = TEXT_HEX_GRAY_144;
    [self addSubview:self.descL];
    self.descL.text = @"已售46份";
    [self.descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.priceL.mas_centerY);
        make.left.mas_equalTo(self.goodsImgv.mas_left).mas_offset(cellWidth/2.0-12);
        make.width.mas_lessThanOrEqualTo(cellWidth/2.0);
    }];
    //加入购物车按钮事件
    self.jiaGWCBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.jiaGWCBtn];
    self.jiaGWCBtn.layer.cornerRadius = 25.0/2;
    [self.jiaGWCBtn setImage:[UIImage imageNamed:@"jiarugouwuche_gai-icon"] forState:UIControlStateNormal];
    [self.jiaGWCBtn addTarget:self action:@selector(clickedJianGWCBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.jiaGWCBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.priceL.mas_centerY);
        make.right.mas_equalTo(self.mas_right).mas_offset(-3);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
}

-(void)clickedJianGWCBtn:(UIButton *)sender{
    
    if (_delegate !=nil &&[_delegate respondsToSelector:@selector(jiaGWCBtn:withGoodsID:withTehuiStatus:)]) {
        [_delegate jiaGWCBtn:sender withGoodsID:@"hh" withTehuiStatus:@"oo"];
    }
    //可以调用加入购物车接口 上面代码可以在加入购物车成功后 显示代理方法 然后绘画动画
}

@end
