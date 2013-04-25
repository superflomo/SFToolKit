#import <UIKit/UIKit.h>

@interface SFBaseTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property UITableView *tableView;
@end
