//
//  HomeGoodsColCell.h
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/4/9.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BtnClickDelegate <NSObject>

@optional
-(void)jiaGWCBtn:(UIButton *)sender withIndex:(NSNumber *)index;

-(void)gmspBtn:(UIButton *)sender withIndexPath:(NSIndexPath *)index;

-(void)jiaGWCBtn:(UIButton *)sender withGoodsID:(NSString *)goodID;

-(void)jiaGWCBtn:(UIButton *)sender withGoodsID:(NSString *)goodID withTehuiStatus:(NSString *)status;

-(void)chooseBtn:(UIButton *)sender withIndex:(NSNumber *)index;

@end

@interface HomeGoodsColCell : UICollectionViewCell<BtnClickDelegate>
@property(nonatomic,weak) id<BtnClickDelegate> delegate;
@property(nonatomic,weak) UIViewController *vc;

@property(nonatomic,strong) UIImageView *goodsImgv;
@property(nonatomic,strong) UILabel *tiMuL;
@property(nonatomic,strong) UILabel *descL;
@property(nonatomic,strong) UILabel *priceL;

@property(nonatomic,strong) UIButton *jiaGWCBtn;

@end
