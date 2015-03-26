//
//  common.h
//  NewStar
//
//  Created by liangyu on 15-3-17.
//  Copyright (c) 2015年 andi. All rights reserved.
//
#define XH_STRETCH_IMAGE(image, edgeInsets) (CURRENT_SYS_VERSION < 6.0 ? [image stretchableImageWithLeftCapWidth:edgeInsets.left topCapHeight:edgeInsets.top] : [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch])
#define kXHNewsTemplateContainerViewHeight  360
#define kXHNewsTemplateContainerViewSpacing 10
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define tableviewBackgroud [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1]