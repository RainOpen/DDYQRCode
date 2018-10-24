#import "ViewController.h"
#import "DDYQRCodeScanController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *qrCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    qrCodeBtn.frame = CGRectMake(15, 120, 120, 20);
    [qrCodeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [qrCodeBtn setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [qrCodeBtn addTarget:self action:@selector(handleScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qrCodeBtn];
    
    UIButton *myCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myCodeBtn.frame = CGRectMake(155, 120, 120, 20);
    [myCodeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [myCodeBtn setTitle:@"我的二维码" forState:UIControlStateNormal];
    [myCodeBtn addTarget:self action:@selector(handleMyQRCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myCodeBtn];
}

- (void)handleScan {
    DDYQRCodeScanController *vc = [[DDYQRCodeScanController alloc] init];
    [vc setStyle:DDYQRCodeScanViewStyleLine];
    [vc setIsEffectRectOnlyInScanview:NO];
    [vc setScanResultBlock:^(NSString *resultStr, NSError *scanError, UIViewController *scanVC) {
        DDYQRCodeResultController *resultVC = [[DDYQRCodeResultController alloc] init];
        resultVC.resultStr = resultStr;
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController pushViewController:resultVC animated:YES];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)handleMyQRCode {
}

@end
