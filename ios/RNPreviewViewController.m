#import "RNPreviewViewController.h"

@implementation RNPreviewViewController

#pragma mark - Preview Actions

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
  // setup a list of preview actions
  UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    NSLog(@"Action 1 triggered");
  }];

  UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Destructive Action" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    NSLog(@"Destructive Action triggered");
  }];

  UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Selected Action" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    NSLog(@"Selected Action triggered");
  }];

  // add them to an arrary
  NSArray *actions = @[action1, action2, action3];

  // add all actions to a group
  UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"Action Group" style:UIPreviewActionStyleDefault actions:actions];
  NSArray *group = @[group1];

  // and return them (return the array of actions instead to see all items ungrouped)
  return group;
}

@end
