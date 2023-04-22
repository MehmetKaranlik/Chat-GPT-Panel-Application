//
//  ExpandedViewController.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import AppKit
import Foundation
import WebKit

class ExpandedViewController: NSViewController {
   let button: NSButton = {
      let button = NSButton()
      button.image = NSImage(systemSymbolName: Constants.expandIconName, accessibilityDescription: Constants.expandAccessiblity)
      button.setButtonType(.momentaryPushIn)
      button.bezelStyle = .texturedRounded
      button.action = #selector(changeWindowSize)
      return button
   }()

   let webView: WKWebView = {
      let view = WKWebView()
      return view
   }()

   override func viewDidLoad() {
      super.viewDidLoad()
      setUp()
   }

   override func loadView() {
      let panelSize = Constants().expandedContentSize
      let rect = NSScreen.main?.topRightCorner(panelSize, padding: Constants.largePadding)
      guard rect != nil else { return }
      view = NSView(frame: rect!)
   }

   @objc func changeWindowSize() {
      let frame = view.window?.frame
      guard frame != nil else { return }
      if frame!.height > Constants.shrinkedContentSize.height {
         shrinkView()
      } else {
         expandView()
      }
   }

   func setUp() {
      view.addSubview(button)
      button.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.smallPadding),
         button.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.smallPadding),

      ])
      view.addSubview(webView)
      webView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         webView.leftAnchor.constraint(equalTo: view.leftAnchor),
         webView.topAnchor.constraint(equalTo: button.bottomAnchor),
         webView.rightAnchor.constraint(equalTo: view.rightAnchor),
         webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      ])
      webView.load(URLRequest(url: Constants.chatGptURL))
   }
}

// functions
extension ExpandedViewController {
   func shrinkView() {
      webView.isHidden = true
      let panelSize = Constants.shrinkedContentSize
      let rect = NSScreen.main?.topRightCorner(panelSize, padding: Constants.largePadding)
      guard rect != nil else { return }
      view.window?.animator().setFrame(rect!, display: true)
   }

   func expandView() {
      webView.isHidden = false
      let panelSize = Constants().expandedContentSize
      let rect = NSScreen.main?.topRightCorner(panelSize, padding: Constants.largePadding)
      guard rect != nil else { return }
      view.window?.animator().setFrame(rect!, display: true)
   }
}
