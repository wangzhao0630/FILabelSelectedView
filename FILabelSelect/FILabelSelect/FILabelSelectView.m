//
//  FILabelSelectView.m
//  FILabelSelect
//
//  Created by flagadmin on 2019/11/5.
//  Copyright © 2019 flagadmin. All rights reserved.
//



#import "FILabelSelectView.h"

@interface FILabelSelectView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView *mCollectionView;
@property(nonatomic, copy) NSArray *dataArray;


@end
@implementation FILabelSelectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)setUpViews{
    [self addSubview:self.mCollectionView];
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"离职", @"在职", @"退休干部", @"部门领导", @"组长", @"负责人",@"技术人员"];
    }
    return _dataArray;
}


#pragma mark -
#pragma mark lazy

- (UICollectionView *)mCollectionView{
    if (!_mCollectionView) {
        
        UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc] init];
//        layout.itemSize =CGSizeMake(80, 30);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 45) collectionViewLayout:layout];
        _mCollectionView.dataSource = self;
        _mCollectionView.delegate = self;
        _mCollectionView.backgroundColor = [UIColor clearColor];
        _mCollectionView.alwaysBounceHorizontal = YES;
        _mCollectionView.alwaysBounceVertical = NO;
        _mCollectionView.showsHorizontalScrollIndicator = YES;
        _mCollectionView.showsVerticalScrollIndicator = NO;
        _mCollectionView.allowsMultipleSelection = YES;
        NSIndexPath  *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_mCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
        [_mCollectionView registerClass:[FIlabelCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([FIlabelCollectionViewCell class])];
    }
    return _mCollectionView;
}

#pragma mark -
#pragma mark UICollectionViewDelegate  UICollectionViewDataSource  UICollectionViewFlowLayoutDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FIlabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FIlabelCollectionViewCell class]) forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArray[indexPath.row];
    if (cell.selected) {
        cell.titleLabel.backgroundColor = [UIColor redColor];

    }else{
        cell.titleLabel.backgroundColor = [UIColor blueColor];

    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FIlabelCollectionViewCell *cell =(FIlabelCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.backgroundColor = [UIColor redColor];
    NSLog(@"选中%@", indexPath);
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    FIlabelCollectionViewCell *cell =(FIlabelCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.backgroundColor = [UIColor blueColor];
    NSLog(@"不选中%@", indexPath);

        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleStr = self.dataArray[indexPath.row];
    CGSize size = [titleStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0]} context:nil].size;
    return CGSizeMake(size.width+20, 30);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@interface FIlabelCollectionViewCell()


@end
@implementation FIlabelCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.contentView.backgroundColor = [UIColor blueColor];
        [self setpUpViews];
    }
    return self;
}
- (void)setpUpViews{
    [self addSubview:self.titleLabel];


}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"离休干部";
        _titleLabel.layer.cornerRadius = 15;
        _titleLabel.clipsToBounds = YES;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        if (self.selected) {
            _titleLabel.backgroundColor = [UIColor redColor];
        }else{
           _titleLabel.backgroundColor = [UIColor blueColor];
        }
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = self.bounds;


}




@end
