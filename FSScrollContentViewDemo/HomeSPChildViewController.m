//
//  HomeSPChildViewController.m
//  ZhenlvApp2
//
//  Created by guangjun wang on 2018/4/8.
//  Copyright © 2018年 zlz. All rights reserved.
//

#import "HomeSPChildViewController.h"
#import "HomeGoodsColCell.h"
#import "Header.h"

@interface HomeSPChildViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,BtnClickDelegate>

@property(nonatomic,strong) UICollectionView *myColView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation HomeSPChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self drawCollectionView];
}

-(void)drawCollectionView{
    //
    CGFloat cellWidth = (SCREEN_WIDTH-24-10)/2.0;
    CGFloat cellHeight = cellWidth*(170/170.0)+15+15+13+13+10+5;
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.flowLayout.itemSize = CGSizeMake(cellWidth, cellHeight+10);
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.minimumInteritemSpacing = 10;
    self.flowLayout.sectionInset = UIEdgeInsetsMake(5, 12, 0, 12);
    self.flowLayout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 0.0001);
    self.flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 0.0001);
    self.myColView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH) collectionViewLayout:self.flowLayout];
    self.myColView.delegate = self;
    self.myColView.dataSource = self;
    self.myColView.backgroundColor = TEXT_HEX_BKG_243;
    self.myColView.showsHorizontalScrollIndicator = NO;
    self.myColView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.myColView];
    [self.myColView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(5);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    [self.myColView registerClass:[HomeGoodsColCell class] forCellWithReuseIdentifier:@"HomeGoodsColCell"];
    
    [self.myColView layoutIfNeeded];
    
    
    [self.myColView reloadData];
    
}

#pragma mark -- collectionVeiw delegate --
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeGoodsColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeGoodsColCell" forIndexPath:indexPath];
    cell.delegate = self;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)jiaGWCBtn:(UIButton *)sender withGoodsID:(NSString *)goodID withTehuiStatus:(NSString *)status{
    NSLog(@"%@",goodID);
    
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
