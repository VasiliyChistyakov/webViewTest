//
//  ViewController.swift
//  WebViewTest
//
//  Created by Чистяков Василий Александрович on 03.04.2021.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero , configuration: configuration)
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        guard let utl = URL(string: "https://www.apple.com/ru/") else {
            return
        }
        webView.load(URLRequest(url: utl))
        webView.customUserAgent = "iPad/Chorme/SomethingRandom"
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.webView.evaluateJavaScript("document.body.innnerHTML"){ result, error in guard let html = result as? String, error == nil else {
               
                return
            }
            print(html)
        }
    }
    
    }
    
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
}

