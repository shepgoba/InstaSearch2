/*



Heavily based on https://github.com/Frostbitee08/Instasearch/blob/master/Tweak.xm, just updated for Instagram's new classes



*/

@interface IGListCollectionView : UIView
- (id) _viewControllerForAncestor;
@end

@interface IGNavigationBar : UINavigationBar 
- (id) _viewControllerForAncestor;
@end

@interface IGSearchBar : UIView
@end

@interface IGExploreViewController: UIViewController
- (void)searchTitleViewDidRequestSearchPresentation:(id)arg1;
@end

%group InstaSearch2
%hook IGDiscoveryNavigationTray
- (id) initWithFrame:(CGRect)a
{
    return NULL;
    %orig;
}
%end

%hook IGViewController
- (void) viewWillAppear:(BOOL)animated
{
    %orig;
    if ([NSStringFromClass([self class]) isEqual: @"IGExploreViewController"])
    {
        IGNavigationBar *bar = (IGNavigationBar *)MSHookIvar<id>(self, "_localNavigationBar");
        if (bar.items.count > 0) {
            UIView *titleView = bar.items[0].titleView;
            if (titleView.subviews.count > 0) {
                IGSearchBar *searchBar = titleView.subviews[0];
                [self searchTitleViewDidRequestSearchPresentation:searchBar];
            }
        }
    }
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
%end
%end

%ctor
{
    %init(InstaSearch2);
}