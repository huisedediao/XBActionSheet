# XBActionSheet
自定义底部菜单

### 安装
pod 'XBActionSheet'

<br/>

### 效果图：
![image](https://github.com/huisedediao/XBActionSheet/raw/master/show.png)<br/>

### 示例代码：

<pre>
#import "ViewController.h"
#import "XBActionSheet.h"

@interface ViewController ()
@property (nonatomic,strong) XBActionSheet *actionSheet;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

//注意要用懒加载，避免从xib或者sb加载的view遮住视图
-(XBActionSheet *)actionSheet
{
    if (_actionSheet==nil)
    {
        NSMutableArray *titleArr=[NSMutableArray new];
        for (int i=0; i<3; i++)
        {
            if (i==2)
            {
                [titleArr addObject:@"删除"];
            }
            else
            {
                [titleArr addObject:[NSString stringWithFormat:@"选项：%zd",i+1]];
            }
        }
        _actionSheet=[[XBActionSheet alloc] initWithDisplayView:self.view];
        _actionSheet.titleArr=titleArr;
        //警告按钮位置
        _actionSheet.destructiveButtonIndex=2;
    }
    return _actionSheet;
}

- (IBAction)showBtnClick:(id)sender {
    [self.actionSheet show];
}

@end

</pre>
