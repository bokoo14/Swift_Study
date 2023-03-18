//
//  WebView.swift
//  H4XOR News
//
//  Created by Bokyung on 2023/03/18.
//

import Foundation
import WebKit
import SwiftUI

// use webview using import WebKit
struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
