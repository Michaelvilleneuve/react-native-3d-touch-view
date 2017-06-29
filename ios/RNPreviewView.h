#import <React/RCTViewManager.h>
#import <React/RCTView.h>
#import "RNPreviewViewController.h"

@interface RNPreviewView : RCTView

@property (nonatomic, copy) RCTBubblingEventBlock onPop;

- (id)initWithBridge:(RCTBridge *)bridge;
- (RNPreviewViewController *)getPreviewViewController;
- (void)didPop;

@end
