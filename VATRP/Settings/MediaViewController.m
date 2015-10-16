//
//  MediaViewController.m
//  ACE
//
//  Created by Ruben Semerjyan on 9/28/15.
//  Copyright © 2015 VTCSecure. All rights reserved.
//

#import "MediaViewController.h"
#import "LinphoneManager.h"

#define kPREFERED_VIDEO_RESOLUTION @"kPREFERED_VIDEO_RESOLUTION"

@interface MediaViewController () {
    BOOL isChanged;
}

@property (weak) IBOutlet NSComboBox *comboBoxVideoSize;

@end

@implementation MediaViewController

- (void) awakeFromNib {
    [super awakeFromNib];
    
    isChanged = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    NSString *video_resolution = [[NSUserDefaults standardUserDefaults] objectForKey:kPREFERED_VIDEO_RESOLUTION];
    
    if (video_resolution) {
        self.comboBoxVideoSize.stringValue = video_resolution;
    } else {
        MSVideoSize vsize = linphone_core_get_preferred_video_size([LinphoneManager getLc]);
        
        if ((vsize.width == MS_VIDEO_SIZE_1080P_W) && (vsize.height == MS_VIDEO_SIZE_1080P_H)) {
            self.comboBoxVideoSize.stringValue = @"1080p (1920x1080)";
        } else if ((vsize.width == MS_VIDEO_SIZE_720P_W) && (vsize.height == MS_VIDEO_SIZE_720P_H)) {
            self.comboBoxVideoSize.stringValue = @"720p (1280x720)";
        } else if ((vsize.width == MS_VIDEO_SIZE_SVGA_W) && (vsize.height == MS_VIDEO_SIZE_SVGA_H)) {
            self.comboBoxVideoSize.stringValue = @"svga (800x600)";
        } else if ((vsize.width == MS_VIDEO_SIZE_4CIF_W) && (vsize.height == MS_VIDEO_SIZE_4CIF_H)) {
            self.comboBoxVideoSize.stringValue = @"4cif (704x576)";
        } else if ((vsize.width == MS_VIDEO_SIZE_VGA_W) && (vsize.height == MS_VIDEO_SIZE_VGA_H)) {
            self.comboBoxVideoSize.stringValue = @"vga (640x480)";
        } else if ((vsize.width == MS_VIDEO_SIZE_CIF_W) && (vsize.height == MS_VIDEO_SIZE_CIF_H)) {
            self.comboBoxVideoSize.stringValue = @"cif (352x288)";
        } else if ((vsize.width == MS_VIDEO_SIZE_QCIF_W) && (vsize.height == MS_VIDEO_SIZE_QCIF_H)) {
            self.comboBoxVideoSize.stringValue = @"qcif (176x144)";
        }  else {
            self.comboBoxVideoSize.stringValue = @"None";
        }
    }
}

- (IBAction)onComboboxPreferedVideoResolution:(id)sender {
    isChanged = YES;
}

- (void) save {
    if (!isChanged) {
        return;
    }
    
    MSVideoSize vsize;

    if ([self.comboBoxVideoSize.stringValue isEqualToString:@"1080p (1920x1080)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, 1080P);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"720p (1280x720)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, 720P);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"svga (800x600)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, SVGA);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"4cif (704x576)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, 4CIF);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"vga (640x480)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, VGA);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"cif (352x288)"]) {
        MS_VIDEO_SIZE_ASSIGN(vsize, CIF);
    } else     if ([self.comboBoxVideoSize.stringValue isEqualToString:@"qcif (176x144)"]) {    
        MS_VIDEO_SIZE_ASSIGN(vsize, QCIF);
    }

    linphone_core_set_preferred_video_size([LinphoneManager getLc], vsize);
    
    [[NSUserDefaults standardUserDefaults] setObject:self.comboBoxVideoSize.stringValue forKey:kPREFERED_VIDEO_RESOLUTION];
}

@end