#import "SFBaseTableViewController.h"

@implementation SFBaseTableViewController

- (void)loadView
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    
	view.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
	UITableView *tableView = [[UITableView alloc] initWithFrame:view.bounds style:UITableViewStyleGrouped];
	tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	tableView.delegate = self;
	tableView.dataSource = self;
	[view addSubview:tableView];
	self.view = view;
	self.tableView = tableView;
}

// Pseudo implementations to avoid compiler warnings
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
