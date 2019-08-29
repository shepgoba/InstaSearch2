#line 1 "noinstaexplore.xm"










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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class IGViewController; @class IGListCollectionView; @class IGDiscoveryNavigationTray; 


#line 26 "noinstaexplore.xm"
static IGDiscoveryNavigationTray* (*_logos_orig$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGDiscoveryNavigationTray*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGDiscoveryNavigationTray* _logos_method$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGDiscoveryNavigationTray*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$InstaSearch2$IGViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL IGViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$InstaSearch2$IGViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL IGViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$InstaSearch2$IGListCollectionView$setDataSource$)(_LOGOS_SELF_TYPE_NORMAL IGListCollectionView* _LOGOS_SELF_CONST, SEL, id<UICollectionViewDataSource>); static void _logos_method$InstaSearch2$IGListCollectionView$setDataSource$(_LOGOS_SELF_TYPE_NORMAL IGListCollectionView* _LOGOS_SELF_CONST, SEL, id<UICollectionViewDataSource>); 


static IGDiscoveryNavigationTray* _logos_method$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGDiscoveryNavigationTray* __unused self, SEL __unused _cmd, CGRect a) _LOGOS_RETURN_RETAINED {
    return NULL;
    _logos_orig$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$(self, _cmd, a);
}




static void _logos_method$InstaSearch2$IGViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL IGViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$InstaSearch2$IGViewController$viewWillAppear$(self, _cmd, animated);
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





 static void _logos_method$InstaSearch2$IGListCollectionView$setDataSource$(_LOGOS_SELF_TYPE_NORMAL IGListCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id<UICollectionViewDataSource> dataSource) {
    if ([NSStringFromClass([[self _viewControllerForAncestor] class]) isEqual: @"IGExploreSingleTopicFeedViewController"])
    {
        self.hidden = TRUE;
        return;
    }
    else
    {
        _logos_orig$InstaSearch2$IGListCollectionView$setDataSource$(self, _cmd, dataSource);
    }
}



static __attribute__((constructor)) void _logosLocalCtor_14bfa6bb(int __unused argc, char __unused **argv, char __unused **envp)
{
    {Class _logos_class$InstaSearch2$IGDiscoveryNavigationTray = objc_getClass("IGDiscoveryNavigationTray"); MSHookMessageEx(_logos_class$InstaSearch2$IGDiscoveryNavigationTray, @selector(initWithFrame:), (IMP)&_logos_method$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$, (IMP*)&_logos_orig$InstaSearch2$IGDiscoveryNavigationTray$initWithFrame$);Class _logos_class$InstaSearch2$IGViewController = objc_getClass("IGViewController"); MSHookMessageEx(_logos_class$InstaSearch2$IGViewController, @selector(viewWillAppear:), (IMP)&_logos_method$InstaSearch2$IGViewController$viewWillAppear$, (IMP*)&_logos_orig$InstaSearch2$IGViewController$viewWillAppear$);Class _logos_class$InstaSearch2$IGListCollectionView = objc_getClass("IGListCollectionView"); MSHookMessageEx(_logos_class$InstaSearch2$IGListCollectionView, @selector(setDataSource:), (IMP)&_logos_method$InstaSearch2$IGListCollectionView$setDataSource$, (IMP*)&_logos_orig$InstaSearch2$IGListCollectionView$setDataSource$);}
}
