//
//  Constants.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import AppKit
import Foundation

struct Constants {
   // URL
   static let chatGptURL = URL(string: "https://chat.openai.com")!
   // String
   static let expandIconName = "arrow.up.right.and.arrow.down.left.rectangle.fill"
   static let newWindowIconName = "macwindow.badge.plus"
   static let statusBarIconName = "logo"
   static let exitIconName = "xmark.circle"
   static let expandAccessiblity = "expand or shrink"
   static let newWindowText = "New Window"

   static let exit = "Exit"

   // Number
   static let smallPadding: CGFloat = 4
   static let largePadding: CGFloat = 16

   // Getter
   static var shrinkedContentSize: CGSize {
      return CGSize(width: 50, height: 50)
   }

   var expandedContentSize: CGSize {
      let frame = NSScreen.main?.visibleFrame
      let size = frame?.size ?? .zero
      let scaled = CGSize(width: size.width / 2, height: size.height / 2)
      return scaled
   }
}
