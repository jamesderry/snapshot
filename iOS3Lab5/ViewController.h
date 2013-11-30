//
//  ViewController.h
//  iOS3Lab5
//
//  Created by James Derry on 11/24/13.
//  Copyright (c) 2013 James Derry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelPhoto;

@end
