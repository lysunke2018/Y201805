//
//  ViewController.h
//  tst2
//
//  Created by coco on 16/3/11.
//  Copyright © 2016年 keke sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource,UIAlertViewDelegate>

@property (nonatomic, strong)  NSArray  *pickerStr;//pickview数据
@property (nonatomic, strong)  NSArray  *pickerData;//
@property (nonatomic, strong) NSString * fScale;

@end

