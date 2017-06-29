#import "RCTView.h"
#import "RNPreviewViewController.h"
#import "RCTBridge.h"
#import "RCTComponent.h"

@interface RNPreviewView : RCTView

@property (nonatomic, copy) RCTBubblingEventBlock onPop;

- (id)initWithBridge:(RCTBridge *)bridge;
- (RNPreviewViewController *)getPreviewViewController;
- (void)didPop;

@end
