/*
 Copyright 2016-present The Material Motion Authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit

/** Retrieve a scoped property builder for the given UIGestureRecognizer. */
public func propertyOf(_ view: UIGestureRecognizer) -> UIGestureRecognizerReactivePropertyBuilder {
  return UIGestureRecognizerReactivePropertyBuilder(view)
}

/** A scoped property builder for UIGestureRecognizer instances. */
public class UIGestureRecognizerReactivePropertyBuilder {

  /** A property representing the view's .isEnabled value. */
  public var isEnabled: ReactiveProperty<Bool> {
    let gestureRecognizer = self.gestureRecognizer
    return ReactiveProperty(initialValue: gestureRecognizer.isEnabled,
                            write: { gestureRecognizer.isEnabled = $0 })
  }

  private let gestureRecognizer: UIGestureRecognizer
  fileprivate init(_ gestureRecognizer: UIGestureRecognizer) {
    self.gestureRecognizer = gestureRecognizer
  }
}