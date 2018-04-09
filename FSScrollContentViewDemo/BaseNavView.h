//
//  BaseNavView.h
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/3/31.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    Left_Nav_Btn,//左
    Right_Nav_Btn//右
} BtnType;

@interface BaseNavView : UIView
@property (nonatomic, copy) void(^BaseNavViewBlock)(BtnType type);
@property(nonatomic,weak) UIViewController * vc;

@property(nonatomic,strong) UILabel *titL;
@property(nonatomic,strong) UIImageView *leftImgv, *rightImgv;
@property(nonatomic,strong) UIButton *leftBtn, *rightBtn;

@end
