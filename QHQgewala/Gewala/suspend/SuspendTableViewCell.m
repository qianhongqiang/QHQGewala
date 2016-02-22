//
//  SuspendTableViewCell.m
//  QHQgewala
//
//  Created by qianhongqiang on 16/2/19.
//  Copyright © 2016年 qianhongqiang. All rights reserved.
//

#import "SuspendTableViewCell.h"

@interface SuspendTableViewCell ()

@property (nonatomic, strong) UIImageView *suspendImageView;

@end

@implementation SuspendTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"reuserId";
    SuspendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SuspendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

#pragma mark - setupUI
- (void)setupUI {
    self.suspendImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 25, 100, 150)];
    self.suspendImageView.image = [UIImage imageNamed:@"beauty"];
    [self addSubview:self.suspendImageView];
}

@end
