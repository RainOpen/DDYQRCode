#import "ViewController.h"
#import "DDYQRCode.h"
#import "DDYQRCodeImgVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *qrCodeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    qrCodeBtn1.frame = CGRectMake(15, 50, [UIScreen mainScreen].bounds.size.width-30, 30);
    [qrCodeBtn1 setBackgroundColor:[UIColor lightGrayColor]];
    [qrCodeBtn1 setTitle:@"扫描二维码1" forState:UIControlStateNormal];
    [qrCodeBtn1 addTarget:self action:@selector(handleScan1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qrCodeBtn1];
    
    UIButton *qrCodeBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    qrCodeBtn2.frame = CGRectMake(15, 100, [UIScreen mainScreen].bounds.size.width-30, 30);
    [qrCodeBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [qrCodeBtn2 setTitle:@"扫描二维码2" forState:UIControlStateNormal];
    [qrCodeBtn2 addTarget:self action:@selector(handleScan2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qrCodeBtn2];
    
    UIButton *myCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myCodeBtn.frame = CGRectMake(15, 150, [UIScreen mainScreen].bounds.size.width-30, 30);
    [myCodeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [myCodeBtn setTitle:@"我的二维码" forState:UIControlStateNormal];
    [myCodeBtn addTarget:self action:@selector(handleMyQRCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myCodeBtn];
}

- (void)handleScan1 {
    DDYQRCodeScanController *vc = [[DDYQRCodeScanController alloc] init];
    [vc setScanResultBlock:^(NSString *resultStr, NSError *scanError, UIViewController *scanVC) {
        DDYQRCodeResultController *resultVC = [[DDYQRCodeResultController alloc] init];
        resultVC.resultStr = resultStr;
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController pushViewController:resultVC animated:YES];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)handleScan2 {
    DDYQRCodeScanController *vc = [[DDYQRCodeScanController alloc] init];
    [vc setStyle:DDYQRCodeScanViewStyleGrid];
    [vc setIsEffectRectOnlyInScanview:YES];
    [vc setScanResultBlock:^(NSString *resultStr, NSError *scanError, UIViewController *scanVC) {
        DDYQRCodeResultController *resultVC = [[DDYQRCodeResultController alloc] init];
        resultVC.resultStr = resultStr;
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController pushViewController:resultVC animated:YES];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)handleMyQRCode {
     [self.navigationController pushViewController:[DDYQRCodeImgVC new] animated:YES];
}

@end
