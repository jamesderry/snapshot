//
//  ViewController.m
//  iOS3Lab5
//
//  Created by James Derry on 11/24/13.
//  Copyright (c) 2013 James Derry. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
{
    UIImagePickerController *myPicker;
    UIImage *image;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPickerController)];
    [[self labelPhoto] addGestureRecognizer:tap];
    
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIImagePickerControllerDelegate methods

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"delegate called.");
    //NSString *mediaType = (NSString *)[info objectForKey:UIImagePickerControllerMediaType]; //needed for movie
    
    image = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"stored image.");
    
    self.imageView.image = image; // needed for image only
    self.labelPhoto.hidden = YES;
    
    /* needed for movie
    // Handle a movie capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        
        NSLog(@"saving video...");
        NSString *moviePath = (NSString *)[[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum (
                                                 moviePath, nil, nil, nil);
        }
    } */
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)showPickerController
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        myPicker = [[UIImagePickerController alloc] init];
        myPicker.delegate = self;
        myPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSString *mediaType = (__bridge NSString *)kUTTypeImage; //photo
        //NSString *mediaType = (__bridge NSString *)kUTTypeMovie; //movie
        myPicker.mediaTypes = [NSArray arrayWithObjects:mediaType, nil];
        myPicker.showsCameraControls = YES;
        [self presentViewController:myPicker animated:YES completion:nil];
        
    } else {
        NSLog(@"camera not available");
    }
}
@end
