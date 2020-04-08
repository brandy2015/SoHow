//
//  XYZWebView.swift
//  TestWKWebView
//
//  Created by 张子豪 on 2019/12/30.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import WebKit

class XYZWebView: NSObject {
    
}
//XYZWebView
public extension WKWebView{
    func setUpWKwebView(string:String? = "https://weibo.com") {
        guard let webString = string else{print("HUD显示地址输入不合法");return}
        guard let myURL = URL(string: webString) else{print("HUD显示字符串转换URL失败");return}
        self.load(URLRequest(url: myURL))
    }
    
    
    //    4.获取网页标题
    //
    //    为了显示标题,首先给ViewController嵌入一个NavigationController。有了导航栏后,我们要调整一下webview的y轴位置,防止导航栏遮住网页上面部分,在viewDidLoad()里写上:
    
    //    //获取导航栏高度
    //    let navHeight = self.navigationController?.navigationBar.frame.height
    //    //获取状态栏高度
    //    let statusHeight = UIApplication.sharedApplication().statusBarFrame.height
    //    webview = WKWebView(frame: CGRectMake(0, statusHeight+navHeight!,self.view.frame.width, self.view.frame.height))
    
    
    
    //    其次,这里要用到WKNavigationDelegate，所以在viewDidLoad()里加上
    //    self.webview.navigationDelegate = self
    //    注意网页标题要在网页加载完成后才能获取,否则为空,于是我们用到'处理网页加载完成'这个方法:
    //    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    //        self.navigationItem.title = self.webview.title
    //    }
    
    
    //    5.前进和后退
    //    首先我们要在navgationBar上添加前进和后退按钮:
    
    //    var btnBack = UIBarButtonItem()
    //    var btnForward = UIBarButtonItem()
    //    func setNavBar() {
    //        btnBack = UIBarButtonItem(title: "后退", style: UIBarButtonItemStyle.Plain, target: self, action: "toBack")
    //        btnForward = UIBarButtonItem(title: "前进", style: UIBarButtonItemStyle.Plain, target: self, action: "toForward")
    //        self.navigationItem.leftBarButtonItem = btnBack
    //        self.navigationItem.rightBarButtonItem = btnForward
    //    }
    
    
    //    然后我们用到了goBack()和goForward()方法,在前进或后退之前我们要判断一下网页是否能够前进或后退:
    //    func toBack() {
    //        if self.webview.canGoBack {
    //            self.webview.goBack()
    //        }
    //    }
    //
    //    func toForward() {
    //        if self.webview.canGoForward {
    //            self.webview.goForward()
    //        }
    //    }
    
    
    //    最后在viewDidLoad()里加上调用setNavBar()方法:
    //    setNavBar()
    
    
    //    我们会发现网页上列表里的文字,包括顶栏上的文字点击了没反应,问题出在哪里呢?这是因为系统阻止了不安全的连接。怎么解决呢？我们就要用到WKUIDelegate中的createWebViewWithConfiguration()这个方法让其允许导航,首先我们要设置自身代理,在viewDidLoad()里加上:
    //
    //    self.webview.UIDelegate = self
    //    其次:
    //
    //    func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
    //        //如果目标主视图不为空,则允许导航
    //        if !(navigationAction.targetFrame?.mainFrame != nil) {
    //            self.webview.loadRequest(navigationAction.request)
    //        }
    //        return nil
    //    }
    
    
    
    //    7.处理js的提示框
    //
    //    现在把网址修改为
    //
    //    http://evt.tiancity.com/csol2/1565/home/index.php
    //    即在viewDidLoad()里修改:
    //
    //    let url = NSURL(string: "http://evt.tiancity.com/csol2/1565/home/index.php")
    //    往下拉,点击'立即领取',本应该出现提示框,却发现什么也没发生。为此,我们要处理一下js的提示框事件。还记得一开始提到的那个方法吧,如下:
    //
    //    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
    //        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    //        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (_) -> Void in
    //            completionHandler()
    //        }))
    //        self.presentViewController(alert, animated: true, completion: nil)
    //    }
    //
    
    
    
    
    //    8.添加进度条
 
    
    
    
}
//(1)loadRequest()  加载请求
//(2)goBack()  网页后退
//(3)goForward()  网页前进
//(4)reload()  网页重新加载
//(5)stopLoading()  网页停止加载
//(6)title  网页标题
//(7)canGoBack  网页是否能够后退
//(8)canGoForward  网页是否能够前进
//(9)estimatedProgress  网页加载中当前的进度
//WKUIDelegate
//
//(1)WKWebView创建初始化加载的一些配置
//func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView?
//
//(2)iOS9.0中新加入的,处理WKWebView关闭的时间
//func webViewDidClose(webView: WKWebView)
//
//(3)处理网页js中的提示框,若不使用该方法,则提示框无效
//func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void)
//
//(4)处理网页js中的确认框,若不使用该方法,则确认框无效
//func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void)
//
//(5)处理网页js中的文本输入
//func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void)
//WKNavigationDelegate
//
//(1)决定网页能否被允许跳转
//func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void)
//
//(2)处理网页开始加载
//func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
//
//(3)处理网页加载失败
//func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError)
//
//(4)处理网页内容开始返回
//func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!)
//
//(5)处理网页加载完成
//func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!)
//
//(6)处理网页返回内容时发生的失败
//func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError)
//
//(7)处理网页进程终止
//func webViewWebContentProcessDidTerminate(webView: WKWebView)
//好勒,我们正式开始实战,首先你得创建一个SingleApplication Project。我这里使用Xcode7.0.1进行演示。若后面版本有改动导致无法运行下面代码,请第一时间在本文底下留言。


