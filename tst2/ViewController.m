//
//  ViewController.m
//  tst2
//
//  Created by coco on 16/3/11.
//  Copyright © 2016年 keke sun. All rights reserved.
//

#import "ViewController.h"
@import WebKit;
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler>
{
    WKWebView * webViewkk;
    
    NSInteger index;
    BOOL flag;

}
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *btnScale;

@property (weak, nonatomic) IBOutlet UIScrollView *srcview;

@end

@implementation ViewController
- (IBAction)btnxxx:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"按钮被点击了" preferredStyle:  UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    
}
- (IBAction)flashClicked:(id)sender {
    
    if (flag) {
        NSString *strUrl= [self.pickerStr objectAtIndex:index];
        [self refresh:strUrl];
        flag =false;
    }
    else{
    
        [webViewkk reload];
    }
   
}
- (IBAction)backClicked:(id)sender {
    
    if (webViewkk.canGoBack)
    {
        
        [webViewkk goBack];
    }
}

- (IBAction)forwardClicked:(id)sender {
    if (webViewkk.canGoForward)
    {
        [webViewkk  goForward];
    }
    
}

-(void)refresh:(NSString *)url{

    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//- (nullable WKNavigation *)loadFileURL:(NSURL *)URL allowingReadAccessToURL:(NSURL *)readAccessURL NS_AVAILABLE(10_11, 9_0);
      [webViewkk loadRequest:request];

     [self performSelector:@selector(doScale) withObject:nil afterDelay:0.05f];

    
}
- (IBAction)scaleClicked:(id)sender {
     NSLog(@"befor－－scale－－000000－－－－%f",webViewkk.scrollView.contentSize.width) ;
    [self doScale];
     NSLog(@"after－－scale－－000000－－－－%f",webViewkk.scrollView.contentSize.width) ;
   

}

-(void)doScale{
//    NSNumber * scale= [NSNumber numberWithFloat:[UIScreen mainScreen].bounds.size.width/(720 )];
//    NSLog(@"--------%@",scale);
//    webViewkk.scrollView.minimumZoomScale=0.1;
//    webViewkk.scrollView.maximumZoomScale=1.0;
//    webViewkk.scrollView.zoomScale=[scale floatValue];
//    NSLog(@"-----docasl");

//     [webViewkk.scrollView setZoomScale:0.57];
}
//-(void)viewDidAppear:(BOOL)animated{
//
//    [super viewDidAppear:NO];
//    [self doScale];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.srcview.contentSize = CGSizeMake(320, 600);
    self.srcview.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    [self.srcview setContentOffset:CGPointMake(0, 110) animated:YES];
//    NSLog(@"---device width-%f",[UIScreen mainScreen].bounds.size.width);
//    // Do any additional setup after loading the view, typically from a nib.
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.btnScale.alpha=0;
//    index = 0;
//    flag = false;
//    [self initPikerView];
////    [self.fScale setValue:@"" forKey:@"fScale"];
////    [self.fScale addObserver:self forKeyPath:@"fScale" options:NSKeyValueObservingOptionNew  context:NULL];
//    [webViewkk addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    //[UIScreen mainScreen].bounds.size.width / 720;
//   /*
//    NSString *strScale= [NSString stringWithFormat:@"%@",scale];
//
//    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'minimum-scale=0.44; maximum-scale=0.44;  initial-scale=0.44; '); document.getElementsByTagName('head')[0].appendChild(meta);";
//      // NSString *jScript =@"";
//
//    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
//    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
//    [wkUController addUserScript:wkUScript];
//
//    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
//    wkWebConfig.userContentController = wkUController;
//    webViewkk = [[WKWebView alloc] initWithFrame:self.webview.frame configuration:wkWebConfig];
//*/
//
//  //  webView.scrollView.contentSize.width=[UIScreen mainScreen].bounds.size.width;
//   NSLog(@"000000－－－－%f",webViewkk.scrollView.contentSize.width) ;
//
//   webViewkk = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
//    webViewkk.scrollView.bounces=NO;
////    webViewkk.scrollView.contentSize=CGSizeMake(webViewkk.scrollView.contentSize.width, webViewkk.scrollView.contentSize.height+ 40);
////     webViewkk.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
////     webViewkk.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
//    webViewkk.UIDelegate=self;
//    webViewkk.navigationDelegate=self;
//    [_webview addSubview:webViewkk];
//    [self refresh:self.pickerStr[0]];
//
//    NSLog(@"estimatedProgress----%f",webViewkk.estimatedProgress);

}
- (void)dealloc
{
    [webViewkk removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"] ) {
        if ([keyPath intValue] == 1) {
            //[self doScale];
        }
    }
    
    NSLog(@"---keypath %@",keyPath);
    if([keyPath isEqualToString:@"fScale"])
    {
        NSLog(@"--result run--%@",[_fScale valueForKey:@"fScale"]);
        //[self doScale];
        
    }

}



//获取宽度已经适配于webView的html。这里的原始html也可以通过js从webView里获取
- (NSString *)htmlAdjustWithPageWidth:(CGFloat )pageWidth
                                 html:(NSString *)html
                              webView:(WKWebView *)webView
{
    NSMutableString *str = [NSMutableString stringWithString:html];
    //计算要缩放的比例
    CGFloat initialScale = webView.frame.size.width/pageWidth;
    //将</head>替换为meta+head
    NSString *stringForReplace = [NSString stringWithFormat:@"<meta name=\"viewport\" content=\" initial-scale=%f, minimum-scale=1, maximum-scale=1, user-scalable=no\"></head>",initialScale];
    
    NSRange range =  NSMakeRange(0, str.length);
    //替换
    [str replaceOccurrencesOfString:@"</head>" withString:stringForReplace options:NSLiteralSearch range:range];
    return str;
}



-(void)initPikerView{
//     NSString  *strUrl=[NSString stringWithFormat:@"%@%.f",@"http://192.168.1.10/mobileapp/home/main/index?os=ios&logicalwidth=", [UIScreen mainScreen].bounds.size.width];
     NSString  *strUrl=[NSString stringWithFormat:@"%@",@"http://192.168.1.10/mobileapp/home/main/index"];

    
//    NSString  *strUrl=[NSString stringWithFormat:@"%@%.f",@"http://192.168.1.102:10809/testmobile/html/file/vip-community/Pmember-community?os=ios&logicalwidth=", [UIScreen mainScreen].bounds.size.width];
    self.pickerStr= @[@"http://192.168.1.10/mobileapp/home/main/index",@"http://192.168.1.10/areas/debug/htmltest/index.html",@"https://www.baidu.com/",];
    NSLog(@"%@",strUrl);
    self.pickerData= @[@"test",@"htmltest/index.html",@"www.baidu.com",];
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

#pragma mark -pickerViewDelegate

#pragma mark 实现协议UIPickerViewDataSource方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerStr count];
}

#pragma mark 实现协议UIPickerViewDelegate方法
-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.pickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"self.pickerStr------%@",[self.self.pickerStr objectAtIndex:row]);
    index = row;
    flag= true;
}


#pragma mark - WKNavigationDelegate

/**
 *  页面开始加载时调用
 *
 *  @param webView    实现该代理的*
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
     NSLog(@"estimatedProgress----%f",webViewkk.estimatedProgress);
}

/**
 *  当内容开始返回时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
    [self performSelector:@selector(doScale) withObject:nil afterDelay:0.05f];

}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
 //[self doScale];
     NSLog(@"%s", __FUNCTION__);

}

/**
 *  页面加载完成之后调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
     NSLog(@"%s", __FUNCTION__);
    
     NSLog(@"estimatedProgress----%f",webViewkk.estimatedProgress);
    
    
//    let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
//    let cookieArray = storage.cookies!
//    var cookieStr:String = ""
//    for cookie in cookieArray
//    {
//        cookieStr += "\(cookie.name )=\(cookie.value);"
//        
//        
//    }

    
   
    //1.layout
   
//    [webView  setNeedsLayout];
//    //2.dispatch
//    dispatch_async(dispatch_get_main_queue(), ^(){
//        webView.scrollView.minimumZoomScale=0.1;
//        webView.scrollView.maximumZoomScale=1.0;
//        webView.scrollView.zoomScale=0.44;
//        //3.kvo
//        [self.fScale setValue:@"1" forKey:@"fScale"];
//    });
    //4.performSelector
  //  [self performSelectorInBackground:@selector(doScale) withObject:nil];
   [self performSelector:@selector(doScale) withObject:nil afterDelay:0.05f];
//     NSLog(@"000000－－－%f",webView.scrollView.contentSize.width) ;
//*/
//    [webView removeFromSuperview];
//   
//    [self.webview addSubview:webView];
//    webView.scrollView.minimumZoomScale=0.1;
//    webView.scrollView.maximumZoomScale=1.0;
//    webView.scrollView.zoomScale=0.44;
    [self readCurrentCookie];
}



-(NSString *)readCurrentCookie{
    NSHTTPCookieStorage*cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSMutableString *cookieString = [[NSMutableString alloc] init];

    NSHTTPCookie *currentCookie= [[NSHTTPCookie alloc] init];
    for (NSHTTPCookie*cookie in [cookieJar cookies]) {
        NSLog(@"cookie--------:%@", cookie);
        if (true) {
            currentCookie = cookie;
            //多个字段之间用“；”隔开
            [cookieString appendFormat:@"%@=%@;",cookie.name,cookie.value];
        }
        
    }
    //删除最后一个“；”
//    [cookieString deleteCharactersInRange:NSMakeRange(cookieString.length - 1, 1)];
//     NSLog(@"cookieString--------:%@", cookieString);
    return cookieString;
}
/**
 *  加载失败时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 *  @param error      错误
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  接收到服务器跳转请求之后调用
 *
 *  @param webView      实现该代理的webview
 *  @param navigation   当前navigation
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
     [self performSelectorInBackground:@selector(doScale) withObject:nil];
}

/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
        decisionHandler(WKNavigationResponsePolicyAllow);
      [self performSelectorInBackground:@selector(doScale) withObject:nil];
   
}

/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
        decisionHandler(WKNavigationActionPolicyAllow);
     [self performSelectorInBackground:@selector(doScale) withObject:nil];
  
}

#pragma mark - WKUIDelegate

/**
 *  web界面中有弹出警告框时调用
 *
 *  @param webView           实现该代理的webview
 *  @param message           警告框中的内容
 *  @param frame             主窗口
 *  @param completionHandler 警告框消失调用
 */


- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)())completionHandler
{
   
    NSLog(@"alert message-------%@",message);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    [self presentViewController:alertController animated:YES completion:^{}];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    
    NSLog(@"%@", message);

}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString *))completionHandler {
    
//    NSLog(@"%@", message);

}

// 从web界面中接收到一个脚本时调用
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    NSLog(@"%@", message);
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{

    return nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
