//
//  HomeShangPinViewController.m
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/4/8.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "HomeShangPinViewController.h"
#import "FSScrollContentView.h"
#import "HomeSPChildViewController.h"
#import "BaseNavView.h"

#import "Header.h"


@interface HomeShangPinViewController ()<FSPageContentViewDelegate,FSSegmentTitleViewDelegate>
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@property(nonatomic,strong) BaseNavView *naviView;

@property(nonatomic,strong) NSMutableArray *arr_title;

@end

@implementation HomeShangPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = TEXT_HEX_BKG_243;
    self.title = @"尚品";
 
    [self drawNavi];
    
    [self drawMainView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark --画导航栏--
-(void)drawNavi{
    
    CGFloat heightNavi  = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    
    self.naviView = [[BaseNavView alloc]init];
    [self.view addSubview:self.naviView];
    self.naviView.backgroundColor = [UIColor whiteColor];
    self.naviView.userInteractionEnabled = YES;
    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(heightNavi);
    }];
    self.naviView.titL.text = @"分类";
    __block typeof(self) mSelf = self;
    self.naviView.BaseNavViewBlock = ^(BtnType type) {
        if (type == Left_Nav_Btn) {
            [mSelf.navigationController popViewControllerAnimated:YES];
        }
        if (type == Right_Nav_Btn) {
            NSLog(@"选择了右键按钮");
        }
    };
    [self.naviView layoutIfNeeded];

}

-(void)drawMainView{
    self.arr_title = [@[@"水果",@"蔬菜",@"米面粮油",@"调味品",@"山珍/坚果",@"肉禽蛋",@"生鲜",@"酒水饮料",@"茶叶/咖啡",@"零食",@"营养保健品",@"生活用品"] mutableCopy];
    
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, self.naviView.bounds.size.height+0.5, SCREEN_WIDTH, 42) titles:self.arr_title delegate:self indicatorType:FSIndicatorTypeEqualTitle];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.titleSelectFont = [UIFont systemFontOfSize:16];
    self.titleView.titleFont = [UIFont systemFontOfSize:16];
    self.titleView.itemMargin = 15;
    self.titleView.selectIndex = 0;
    self.titleView.titleSelectColor = THEME_GREEN_133;
    self.titleView.indicatorColor = THEME_GREEN_133;
    [self.view addSubview:self.titleView];

    [self.titleView layoutIfNeeded];
    
    NSMutableArray *childVCs = [[NSMutableArray alloc]init];
    for (int i = 0; i<self.arr_title.count; i ++) {
        NSString *title = self.arr_title[i];
        
        HomeSPChildViewController *vc = [[HomeSPChildViewController alloc]init];
        vc.title = title;
        vc.view.backgroundColor = TEXT_HEX_BKG_243;
       
        [childVCs addObject:vc];
    }

    self.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, self.naviView.bounds.size.height+42, SCREEN_WIDTH,SCREEN_HEIGHT-(self.naviView.bounds.size.height+42+self.tabBarController.tabBar.frame.size.height)) childVCs:childVCs parentVC:self delegate:self];
    self.pageContentView.contentViewCurrentIndex = 0;
    
    [self.view addSubview:self.pageContentView];
//    [self.pageContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.titleView.mas_bottom);
//        make.left.right.bottom.mas_equalTo(self.view);
//    }];
    [self.pageContentView layoutIfNeeded];
}

#pragma mark --
- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)arr_title{
    if (!_arr_title) {
        _arr_title = [NSMutableArray array];
    }
    return _arr_title;
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
