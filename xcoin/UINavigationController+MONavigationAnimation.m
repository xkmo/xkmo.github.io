//
//  UIViewController+MONavigationAnimation.m
//  MOLib
//
//  Created by mo jun on 10/27/12.
//  Copyright (c) 2012 mo jun. All rights reserved.
//

#import "UINavigationController+MONavigationAnimation.h"
#define MO_FLIP_TRANSITION_DURATION 0.7f

@implementation UINavigationController (MONavigationAnimation)

- (void)pushViewController:(UIViewController *)controller animatedWithTransition:(UIViewAnimationTransition)transition{
    [self pushViewController:controller animated:NO];
    
    [UIView beginAnimations:@"pushAnimation" context:nil];
    [UIView setAnimationDuration:MO_FLIP_TRANSITION_DURATION];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
    
}

- (UIViewController *)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition{
    UIViewController *poppedController = [self popViewControllerAnimated:NO];
    
    [UIView beginAnimations:@"popAnimation" context:nil];
    [UIView setAnimationDuration:MO_FLIP_TRANSITION_DURATION];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationTransition:transition forView:self.view cache:NO];
    [UIView commitAnimations];
    
    return poppedController;
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID isEqualToString:@"pushAnimation"]) {
        [self pushViewControllerDidStop];
    } else if ([animationID isEqualToString:@"popAnimation"]){
        [self popViewControllerDidStop];
    }
}

- (void)pushViewControllerDidStop{
    
}

- (void)popViewControllerDidStop{
    
}

@end
