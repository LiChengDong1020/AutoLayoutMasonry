//
//  CustomCell.m
//  CellAutoLayoutHeight
//
//  Created by lichengdong on 2024/4/10.
//

#import "CustomCell.h"
#import <Masonry.h>
@interface CustomCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *titleLabel1;

@end
@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        [self createUI];
    }
    return self;
}
- (void)createUI {
    
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.titleLabel1];

    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5, 10, 5, 10));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.mas_top).offset(5);
        make.left.equalTo(self.backView.mas_left).offset(5);
        make.right.equalTo(self.backView.mas_right).offset(-5);
    }];
    
    [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.backView.mas_left).offset(5);
        make.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self.backView.mas_bottom).offset(-5);
    }];
}
- (void)setTitle:(NSString *)title{
    _titleLabel.text = [NSString stringWithFormat:@"标题111%@",title];
    _titleLabel1.text = [NSString stringWithFormat:@"标题222%@",title];
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = UIColor.blueColor;
        
    }
    return _backView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UILabel *)titleLabel1 {
    if (!_titleLabel1) {
        _titleLabel1 = [[UILabel alloc]init];
        _titleLabel1.font = [UIFont systemFontOfSize:15];
        _titleLabel1.textColor = UIColor.whiteColor;
        _titleLabel1.numberOfLines = 0;
    }
    return _titleLabel1;
}

@end
