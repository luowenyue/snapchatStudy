//
//  SWRAddFriendTableViewCell.h
//  SnapchatStudy
//
//  Created by Weiran Shi on 2015-11-25.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWRAddFriendTableViewCell : UITableViewCell

@property (nonatomic, strong) PFUser *friendUser;
@property (nonatomic, copy) NSString *friendName;

+ (instancetype)SWRAddFriendCellWithTableView:(UITableView *)tableView;

@end
