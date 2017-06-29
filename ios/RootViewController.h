#import <UIKit/UIKit.h>
#import "RNPreviewViewController.h"
#import "RNPreviewView.h"

@interface RootViewController : UIViewController

- (void)setPreviewController:(RNPreviewViewController *)controller forReactPreviewView:(RNPreviewView *)reactView;
- (void)setSourceView:(UIView *)view;

@end

