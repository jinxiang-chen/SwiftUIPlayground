//
//  WebView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/6/6.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    typealias UIViewType = WKWebView
        
}
