#import "RNPreviewViewManager.h"
#import "RNPreviewView.h"
#import "RootViewController.h"
#import "RCTUIManager.h"

@implementation RNPreviewViewManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;
@synthesize methodQueue = _methodQueue;

- (UIView *)view
{
  return [[RNPreviewView alloc] initWithBridge:_bridge];
}

- (dispatch_queue_t)methodQueue
{
  return _bridge.uiManager.methodQueue;
}

RCT_EXPORT_METHOD(setSourceView:(nonnull NSNumber *)reactTag)
{
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    UIView *view = viewRegistry[reactTag];
    RootViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootViewController setSourceView:view];
  }];
}

/* Need to be able to set the target view too */
RCT_EXPORT_METHOD(activate:(nonnull NSNumber *)reactTag)
{
  [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
    RNPreviewView *view = viewRegistry[reactTag];

    if (![view isKindOfClass:[RNPreviewView class]]) {
      RCTLogError(@"Invalid view returned from registry, expecting RNPreviewView, got: %@", view);
    } else {
      RNPreviewViewController *controller = [view getPreviewViewController];
      RootViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
      [rootViewController setPreviewController:controller forReactPreviewView:view];
    }
  }];
}

RCT_EXPORT_VIEW_PROPERTY(onPop, RCTBubblingEventBlock);

@end
