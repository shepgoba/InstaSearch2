#import <objc/runtime.h>

@interface IGListCollectionView : UIView
- (UIViewController*)viewController;
- (id) _viewControllerForAncestor;
@end

%hook IGDiscoveryNavigationTray
- (id) initWithFrame:(CGRect)a
{
    return NULL;
}
%end

%hook IGListCollectionView

 - (void)setDataSource:(id<UICollectionViewDataSource>)dataSource
{
    if ([NSStringFromClass([[self _viewControllerForAncestor] class]) isEqual: @"IGExploreSingleTopicFeedViewController"])
    {
        self.hidden = TRUE;
        return;
    }
    else
    {
        %orig;
    }
}
/*
%new
- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];

        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }

    return nil;
}
*/
%end
interface IGListCollectionView : UIView
- (UIViewController*)viewController;
- (id) _viewControllerForAncestor;
@end

%hook IGDiscoveryNavigationTray
- (id) initWithFrame:(CGRect)a
{
    return NULL;
    %orig;
}
%end

@interface IGExploreTopicalFeedViewController: UIViewController
- (void)searchTitleViewDidRequestSearchPresentation:(id)arg1;
@end

@interface IGNavigationBar: UINavigationBar 
- (id) _viewControllerForAncestor;
@end

@interface IGSearchBar : UIView
@property(nonatomic) bool showsCancelButton;
@end

@interface IGExploreViewController: UIViewController
- (void)searchTitleViewDidRequestSearchPresentation:(id)arg1;
@end

%hook IGNavigationBar 
- (void) layoutSubviews
{
    %orig;
    if (self.items.count > 0) {
        UIView *titleView = self.items[0].titleView;
        if (titleView.subviews.count > 0) {
            IGSearchBar *searchBar = titleView.subviews[0];
            [[self _viewControllerForAncestor] searchTitleViewDidRequestSearchPresentation:searchBar];
      }
    }
}