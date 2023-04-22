//
//  NSScreen+Extensions.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import AppKit
import Foundation

extension NSScreen {
   func topRightCorner(_ contentSize: CGSize, padding: CGFloat) -> NSRect {
      let resolution = self.visibleFrame
      let x = contentSize.width
      let y = contentSize.height
      let realX = resolution.maxX - x - padding
      let realY = resolution.maxY - y - padding
      return CGRect(x: realX, y: realY, width: contentSize.width, height: contentSize.height)
   }
}
