//
//  ViewController.m
//  CellAutoLayoutHeight
//
//  Created by lichengdong on 2024/4/10.
//

#import "ViewController.h"
#import "CustomCell.h"
#import <Masonry.h>
#define KIsiPhoneX \
({ \
  BOOL KIsiPhoneX = NO; \
  if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) { \
    KIsiPhoneX = NO; \
  } else if (@available(iOS 11.0, *)) { \
    KIsiPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0; \
  } \
  (KIsiPhoneX); \
})
#define kFCNavigationBarMaxY (KIsiPhoneX ? 88 : 64)
#define kFCTabbarHeight (KIsiPhoneX ? 83 : 49)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [NSMutableArray arrayWithObjects:@"1111准备一个汉字数组，用于随机选择汉字", @"2222生成多个字符串，构成字符串数组",@"准备一个汉准备一个汉字数组，用于随机选择汉字字数组，用于随机选择汉字",nil];
    [self configSubViews];
}
- (void)configSubViews {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(88);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-83);
    }];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColor.grayColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"CustomCell"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomCell class]) forIndexPath:indexPath];
    cell.title = self.array[indexPath.row];
    return cell;
}
@end
