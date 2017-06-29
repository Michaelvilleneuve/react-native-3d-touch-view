#import "RNPreviewView.h"
#import "RNPreviewViewController.h"
#import <React/RCTView.h>

@implementation RNPreviewView {
  RNPreviewViewController *_controller;
  RCTView *_previewBaseView;
}

- (id)initWithBridge:(RCTBridge *)bridge
{
  if ((self = [super initWithFrame:CGRectZero])) {
    _controller = [[RNPreviewViewController alloc] init];
    _previewBaseView = [[RCTView alloc] init];
    _controller.view = _previewBaseView;
  }

  return self;
}

- (RNPreviewViewController *)getPreviewViewController {
  return _controller;
}

- (void)didPop
{
  if (_onPop) {
    _onPop(@{});
  }
}

- (NSArray *)reactSubviews
{
  return [NSArray arrayWithObjects:_previewBaseView, nil];
}

- (void)insertReactSubview:(UIView *)view atIndex:(NSInteger)atIndex
{
  [_previewBaseView insertReactSubview:view atIndex:atIndex];
}

@end
