#import "RootViewController.h"
#import "RNPreviewViewController.h"
#import "RNPreviewView.h"

@interface RootViewController () <UIViewControllerPreviewingDelegate>
@end

@implementation RootViewController {
  RNPreviewViewController *_previewController;
  RNPreviewView *_reactView;
}

- (void)setPreviewController:(RNPreviewViewController *)controller forReactPreviewView:(RNPreviewView *)reactView
{
  _previewController = controller;
  _reactView = reactView;
}

- (void)setSourceView:(RCTView *)view
{
  NSLog(@"setting source view!");
  [self registerForPreviewingWithDelegate:(id)self sourceView:view];
}

# pragma mark - 3D Touch Delegate

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
  if ([self.presentedViewController isKindOfClass:[RNPreviewViewController class]]) {
    return nil;
  }

  return _previewController;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext
        commitViewController:(UIViewController *)viewControllerToCommit
{
  [_reactView didPop];
}

@end
