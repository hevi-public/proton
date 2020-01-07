//
//  MockRichTextViewDelegate.swift
//  ProtonTests
//
//  Created by Rajdeep Kwatra on 7/1/20.
//  Copyright © 2020 Rajdeep Kwatra. All rights reserved.
//

import Foundation
import UIKit

@testable import Proton

class MockRichTextViewDelegate: RichTextViewDelegate {
    var onSelectionChanged: ((RichTextView, NSRange, [EditorAttribute], EditorContent.Name) -> Void)?
    var onKeyReceived: ((RichTextView, EditorKey, NSRange, Bool) -> Void)?
    var onReceivedFocus: ((RichTextView, NSRange) -> Void)?
    var onLostFocus: ((RichTextView, NSRange) -> Void)?

    func richTextView(_ richTextView: RichTextView, didChangeSelection range: NSRange, attributes: [EditorAttribute], contentType: EditorContent.Name) {
        onSelectionChanged?(richTextView, range, attributes, contentType)
    }

    func richTextView(_ richTextView: RichTextView, didReceiveKey key: EditorKey, at range: NSRange, handled: inout Bool) {
        onKeyReceived?(richTextView, key, range, handled)
    }

    func richTextView(_ richTextView: RichTextView, didReceiveFocusAt range: NSRange) {
        onReceivedFocus?(richTextView, range)
    }

    func richTextView(_ richTextView: RichTextView, didLoseFocusFrom range: NSRange) {
        onLostFocus?(richTextView, range)
    }
}