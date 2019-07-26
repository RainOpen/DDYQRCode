/** MARK: - DDYQRCodeManager 2018/10/23
 *  !!!: Author: 豆电雨
 *  !!!: QQ/WX:  634778311
 *  !!!: Github: https://github.com/RainOpen/
 *  !!!: Blog:   https://www.jianshu.com/u/a4bc2516e9e5
 *  MARK: - DDYQRCodeScanView.m
 */

#import "DDYQRCodeScanView.h"
#import "DDYQRCodeManager.h"
#import "NSBundle+DDYQRCode.h"

@interface DDYQRCodeScanView ()
/** 扫描框带边角视图 */
@property (nonatomic, strong) UIImageView *scanBackView;
/** 扫描线 */
@property (nonatomic, strong) UIImageView *scanLineView;

@end

@implementation DDYQRCodeScanView
@synthesize style = _style;
@synthesize scanRectColor = _scanRectColor;

- (DDYQRCodeScanViewStyle)style {
    if (!_style) {
        _style = DDYQRCodeScanViewStyleLine;
    }
    return _style;
}

- (UIColor *)scanRectColor {
    if (!_scanRectColor) {
        _scanRectColor = [UIColor colorWithRed:85./255. green:180./255. blue:55./255. alpha:1];
    }
    return _scanRectColor;
}

- (UIImageView *)scanBackView {
    if (!_scanBackView) {
        _scanBackView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _scanBackView;
}

- (UIImageView *)scanLineView {
    if (!_scanLineView) {
        _scanLineView = [[UIImageView alloc] init];
    }
    return _scanLineView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scanBackView];
        [self addSubview:self.scanLineView];
        [self setClipsToBounds:YES];
    }
    return self;
}

- (void)setStyle:(DDYQRCodeScanViewStyle)style {
    _style = style;
    [self changeStyle];
}

- (void)setScanRectColor:(UIColor *)scanRectColor {
    _scanRectColor = scanRectColor;
    [self changeStyle];
}

- (void)changeStyle {

    if (self.style == DDYQRCodeScanViewStyleLine) {
        self.scanLineView.frame = CGRectMake(0, 0, self.bounds.size.width, 2);
        self.scanBackView.image = [DDYQRCodeManager scanImageWithColor:self.scanRectColor];
        self.scanLineView.image = [[NSBundle ddyImage:@"ScanLine"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.scanLineView.tintColor = self.scanRectColor;
    } else {
        self.scanLineView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        self.scanBackView.image = [DDYQRCodeManager scanImageWithColor:self.scanRectColor];
        self.scanLineView.image = [[NSBundle ddyImage:@"ScanGrid"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.scanLineView.tintColor = self.scanRectColor;
    }
    [self scanAnimation:-self.scanLineView.bounds.size.height/2.0 endValue:self.bounds.size.height+self.scanLineView.bounds.size.height/2.0];
}

- (void)scanAnimation:(CGFloat)startValue endValue:(CGFloat)endValue {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    basicAnimation.duration = 1.8;
    basicAnimation.fromValue = @(startValue);
    basicAnimation.toValue = @(endValue);
    basicAnimation.repeatCount = CGFLOAT_MAX;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.scanLineView.layer addAnimation:basicAnimation forKey:@"scanAnimation"];
}

@end
// [DDYQRCodeManager scanImageWithColor:[UIColor colorWithRed:85./255. green:180./255. blue:55./255. alpha:1]]
// [DDYQRCodeManager scanImageWithColor:[UIColor colorWithRed:255./255. green:128./255. blue:0./255. alpha:1]]
