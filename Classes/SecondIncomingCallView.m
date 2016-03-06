//
//  InCallNewCallNotificationView.m
//  linphone
//
//  Created by Ruben Semerjyan on 3/3/16.
//
//

#import "SecondIncomingCallView.h"

#define kAnimationDuration 0.5f

static NSString *BackgroundAnimationKey = @"animateBackground";

@interface SecondIncomingCallView ()

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundViewTopConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *callStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *ringCountLabel;

@property (nonatomic, assign) LinphoneCall *call;

@end

@implementation SecondIncomingCallView

#pragma mark - Private Methods

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    self.profileImageView.layer.cornerRadius = CGRectGetHeight(self.profileImageView.frame)/2;
    self.profileImageView.layer.borderWidth = 1.f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

//Filles notification data with LinphoneCall model
- (void)fillWithCallModel:(LinphoneCall *)linphoneCall {
    //TODO: Fill with passed method's param
    
    self.call = linphoneCall;
}

#pragma mark - Action Methods

- (IBAction)notificationViewAction:(UIButton *)sender {
    
    if (self.notificationViewActionBlock) {
        self.notificationViewActionBlock(self.call);
    }
}


#pragma mark - Animations

//Showes view
- (void)showNotificationWithAnimation:(BOOL)animation completion:(void(^)())completion {
    
    self.viewState = VS_Animating;
    NSTimeInterval duration = animation ? kAnimationDuration : 0;
    self.alpha = 1;
    [self startBackgroundColorAnimation];
    
    [UIView animateWithDuration:duration
                     animations:^{
                         
                         self.backgroundViewTopConstraint.constant = 0;
                         [self layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         
                         self.viewState = VS_Opened;
                         if (completion && finished) {
                             completion();
                         }
                     }];
}

//Hides view
- (void)hideNotificationWithAnimation:(BOOL)animation completion:(void(^)())completion {
    
    self.viewState = VS_Animating;
    NSTimeInterval duration = animation ? kAnimationDuration : 0;
    [self stopBackgroundColorAnimation];
    if (animation) {
        [UIView animateWithDuration:duration
                         animations:^{
                             self.backgroundViewTopConstraint.constant = -CGRectGetHeight(self.frame);
                             [self layoutIfNeeded];
                         } completion:^(BOOL finished) {
                             self.alpha = 0;
                             self.viewState = VS_Closed;
                             if (completion && finished) {
                                 completion();
                             }
                         }];
    } else {
        self.alpha = 0;
    }
    
}


- (void)startBackgroundColorAnimation {
    
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    theAnimation.duration = 0.7f;
    theAnimation.repeatCount = HUGE_VAL;
    theAnimation.autoreverses = YES;
    theAnimation.toValue = (id)[UIColor colorWithRed:0.1843 green:0.1961 blue:0.1961 alpha:1.0].CGColor;
    [self.backgroundView.layer addAnimation:theAnimation forKey:BackgroundAnimationKey];
}

- (void)stopBackgroundColorAnimation {
    [self.backgroundView.layer removeAnimationForKey:BackgroundAnimationKey];
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
